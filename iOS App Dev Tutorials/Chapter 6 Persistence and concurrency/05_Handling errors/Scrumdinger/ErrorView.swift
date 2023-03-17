//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/17.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper // Wrapper property.
    
    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            // 헤드라인 글꼴로 오류 설명을 표시하려면 텍스트 보기를 추가
            // 오류는 현지화된 문자열 설명을 제공
            
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            // 캡션 글꼴 및 패딩과 함께 지침을 표시하는 텍스트 보기를 추가
            Text(errorWrapper.guidance)
                           .font(.caption)
                           .padding(.top)
            Spacer()
        }
        .padding()
        // 배경을 흐리게 하면 이 오류 보기에 주의가 집중
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    // 샘플 오류 속성을 나타내기 위해 미리 보기 구조에서 새 SampleError 열거형을 만듬
    enum SampleError: Error {
        case errorRequired
    }
    
    // errorRequired 속성을 사용하여 오류 래퍼를 초기화하는 새 정적 property을 만듬
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View {
        // 오류 래퍼를 ErrorView 이니셜라이저에 전달
        ErrorView(errorWrapper: wrapper)
    }
}
