//
//  CameraManager.swift
//  PracticeAVFoundation
//
//  Created by KyungHeon Lee on 2023/02/17.
//

import AVFoundation

// 클래스의 인스턴스를 관찰하고 있다가 값이 변경되면 뷰를 업데이트 함
class CameraManager: ObservableObject {
    // 상태 열거형 선언
    enum Status {
        case unconfigured
        case configured
        case unauthorized
        case failed
    }
    
    // 에러 종류 열거형으로 선언
    enum CameraError: Error {
        case cameraUnavailable
        case cannotAddInput
        case cannotAddOutput
        case deniedAuthorization
        case restrictedAuthorization
        case unknownAuthorization
        case thrownError(message: Error)
    }
    
    // 카메라 관련 오류를 나타내는 오류
    @Published var error: CameraError?
    
    // 초기화
    private init() {
        configure()
    }
    
    private func configure() {
        checkPermissions()
        sessionQueue.async {
          self.configureCaptureSession()
          self.session.startRunning()
        }
    }
    
    // data output
    let session = AVCaptureSession()
    // 카메라 이미지를 적절한 데이터 출력으로 보내는 것을 조정
    static let shared = CameraManager()
    // 카메라 구성을 변경하는데 세션 대기열
    private let sessionQueue = DispatchQueue(label: "domain.expiry.SessionQ")
    // AVCaptureSession에 연결할 비디오 데이터 출력, 세션이 구성된 후 대리자를 변경할 수 있도록 속성으로 저장
    private let videoOutput = AVCaptureVideoDataOutput()
    // 현재 카메라 상태
    private var status = Status.unconfigured
    
    // 게시된 오류를 전달된 오류로 설정합니다. 게시된 속성은 기본 스레드에서 설정해야 하므로 기본 스레드에서 이 작업을 수행
    private func set(error: CameraError?) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
    
    private func checkPermissions() {
        // 스위치문으로 인증 상태
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                // 반환된 장치 상태가 확인되지 않은 경우
                // 세션 대기열을 일시 중단하고 iOS에서 카메라 사용 권한을 요청
                sessionQueue.suspend()
                AVCaptureDevice.requestAccess(for: .video) { authorized in
                    // 사용자가 액세스를 거부하면 CameraManager의 상태를
                    //.unauthorized로 설정하고 오류를 설정
                    if !authorized {
                        self.status = .unauthorized
                        self.set(error: .deniedAuthorization)
                    }
                    self.sessionQueue.resume() // 결과에 관계없이 세션 대기열을 재개
                }
                // .restricted 및
            case .restricted:
                status = .unauthorized
                set(error: .restrictedAuthorization)
                // .denied 상태의 경우
            case .denied:
                status = .unauthorized
                set(error: .deniedAuthorization)
                // CameraManager의 상태를 .unauthorized로 설정하고 적절한 오류를 설정
                
                // .authorized 상태의 경우
            case .authorized:
                break // 이미 권한이 부여된 경우에는 아무 것도 할 필요가 없으므로 탈출
                // 디폴트 추가
            @unknown default:
                status = .unauthorized
                set(error: .unknownAuthorization)
        }
    }
    
    private func configureCaptureSession() {
        guard status == .unconfigured else {
            return
        }
        session.beginConfiguration()
        defer {
            session.commitConfiguration()
        }
        
        // 캡처 장치를 가져옴
        let device = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .front) // 전면 카메라
        guard let camera = device else {
            set(error: .cameraUnavailable)
            status = .failed // 어떤 이유로 nil이면 오류로 설정
            return
        }
        
        // AVCaptureSession
        // do - catch 구조
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            // 가능한 경우
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput) // AVCaptureSession에 카메라 입력을 추가
            } else {
                // 오류와 상태를 설정하고 일찍 돌아감
                set(error: .cannotAddInput)
                status = .failed
                return
            }
        } catch { // 오류가 발생한 경우
            // 오류를 기반으로 오류를 설정하여 디버깅 및 반환에 도움이 되도록 함
            set(error: .thrownError(message: error))
            status = .failed
            return
        }
        status = .configured
    }
    
    // AVCaptureVideoDataOutput에서 대리자 호출을 수신할 FrameManager가 필요
    //  향후 프레임 관리자가 해당 카메라 데이터를 수신하는 대리자로 설정
    func set(
      _ delegate: AVCaptureVideoDataOutputSampleBufferDelegate,
      queue: DispatchQueue
    ) {
      sessionQueue.async {
        self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
      }
    }
}
