//
//  FrameManager.swift
//  PracticeAVFoundation
//
//  Created by KyungHeon Lee on 2023/02/17.
//

import AVFoundation

// FrameManager는 CameraManager에서 데이터를 수신하고 앱의 다른 곳에서 사용할 프레임을 게시하는 일을 담당
// 한번에 만들 수도 있지만 명확함을 위해 구분
// 이 FramManager에 전처리 또는 동기화 같은 더 많은 기능을 넣어둠

// 이 클래스는 NSObject에서 상속,ObservableObject를 따름
// AVCaptureSession의 비디오 출력을 채택하기 때문에 NSObject에서 상속해야함
class FrameManager: NSObject, ObservableObject {
    static let shared = FrameManager()
    // 카메라에서 받은 현재 프레임에 대해 게시된 속성을 추가
    // 다른 클래스가 카메라 데이터를 얻기 위해 Published 선언
    @Published var current: CVPixelBuffer?
    
    // receive capture data
    let videoOutputQueue = DispatchQueue(
        label: "domain.expiry.VideoOutputQ",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem)
    
    // FrameManager를 AVCaptureVideoDataOutput의 대리자로 설정
    private override init() {
        super.init()
        CameraManager.shared.set(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.current = buffer
            }
        }
    }
}
