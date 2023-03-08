//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/09.
//

import Foundation
import SwiftUI

// ObservableObject를 준수하는 ScrumStore 클래스
class ScrumStore: ObservableObject {
    // Published scrums property of type [DailyScrum] 추가
    @Published var scrums: [DailyScrum] = []
    // ObservableObject에는 @Published 속성 중 하나가 변경되려고 할 때 방출하는 objectWillChange 게시자가 포함되어있음
    
    // URL을 반환하는 fileURL이라는 비공개 정적 던지기 함수를 추가
    private static func fileURL() throws -> URL {
        // 기본 파일 관리자에서 url(for:in:appropriateFor:create:)을 호출
        // FileManager 클래스의 공유 인스턴스를 사용하여 현재 사용자의 문서 디렉토리 위치를 가져옴
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
        // appendingPathComponent(_:)를 호출하여 scrums.data라는 파일의 URL을 반환
        .appendingPathComponent("scrums.data")
    }
    
    // 데이터를 로드하는 정적 메소드를 추가
    // 결과는 성공이든 실패든 작업의 ​​결과를 나타내는 단일 유형
    // load 함수는 스크럼 배열 또는 오류와 함께 비동기적으로 호출하는 완료 클로저를 수락
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        // 백그라운드 큐에 비동기 블록을 만듬
        // 디스패치 대기열은 애플리케이션이 작업을 제출할 수 있는 선입선출(FIFO) 대기열
        // 백그라운드 작업은 모든 작업 중에서 우선 순위가 가장 낮음
        DispatchQueue.global(qos: .background).async {
            // 데이터 로드 오류를 처리하는 do-catch 문 추가
            do {
                // do 절에서 파일 URL에 대한 로컬 상수
                let fileURL = try fileURL()
                // scrums.data를 읽기 위한 파일 핸들러
                // 사용자가 앱을 처음 시작할 때 scrums.data가 존재하지 않기 때문에 파일 핸들을 여는 중 오류가 발생하면 빈 배열로 완료 핸들러를 호출
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                // 파일의 사용 가능한 데이터를 dailyScrums라는 로컬 상수로 디코딩
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                // 기본 대기열에서 디코딩된 스크럼을 완료 처리기로 전달
                // 파일을 열고 백그라운드 큐에서 해당 콘텐츠를 디코딩하는 장기 실행 작업을 수행
                // 작업이 완료되면 기본 대기열로 다시 전환
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch { // catch 절에서 완료 처리기에 오류를 전달
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
