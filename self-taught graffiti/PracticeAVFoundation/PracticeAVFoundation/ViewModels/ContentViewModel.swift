//
//  ContentViewModel.swift
//  PracticeAVFoundation
//
//  Created by KyungHeon Lee on 2023/02/17.
//

import CoreImage

class ContentViewModel: ObservableObject {
    // frame은 FrameView가 표시할 이미지
    @Published var frame: CGImage?
    // frame 생성에 사용되는 데이터는 FrameManager에서 가져옴
    private let frameManager = FrameManager.shared
    
    @Published var error: Error?
    private let cameraManager = CameraManager.shared

    
    init() {
        setupSubscriptions()
    }
    // 모든 Combine 파이프라인을 setupSubscriptions()에 추가하여 한 곳에 보관
    func setupSubscriptions() {
        // 여기서 SwiftUI에서 Combine을 사용하는 이유가 나옴
        // FrameView에 필요한 CGImage는 CVPixelBuffer 데이터로 되어 있어 변환이 필요
        // 이럴때 Combine
        
        frameManager.$current
            .receive(on: RunLoop.main) // 메인에 수신
            .compactMap { buffer in
                // CVPixelBuffer를 CGImage로 변환하고 compactMap을 통해 모든 nil 값을 필터링
                if buffer != nil {
                    let inputImage = CIImage(cvPixelBuffer: buffer!)
                    let context = CIContext(options: nil)
                    return context.createCGImage(inputImage, from: inputImage.extent)
                } else {
                    return nil
                }
            }
            .assign(to: &$frame)

        cameraManager.$error
          .receive(on: RunLoop.main)
          .map { $0 } // 편의
          .assign(to: &$error)
    }
}
