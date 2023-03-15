/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("scrums.data")
    }
    
    // ScrumStore.swift에서 스크럼 배열을 반환하는 load라는 정적 함수 생성
    // 매개 변수 목록 뒤에 async 키워드를 추가하면 함수가 비동기임을 나타냄
    // throw 함수의 경우 throws 키워드 앞에 async를 작성
    static func load() async throws -> [DailyScrum] {
        // await 키워드를 사용하여 withCheckedThrowingContinuation을 호출
        // CheckedThrowingContinuation으로 호출하면 로드 함수가 일시 중단된 다음 제공한 클로저로 컨티뉴에이션을 전달
        // 컨티뉴에이션은 기다리던 함수 이후의 코드를 나타내는 값
        try await withCheckedThrowingContinuation { continuation in
            // 클로저에서 완료 핸들러를 사용하여 레거시 로드 함수를 호출
            // 완료 핸들러가 Result<[DailyScrum], Error> 열거를 수신한다는 점을 상기하셈
            load { result in
                // 결과 사례를 처리하기 위해 switch 문을 추가
                switch result {
                    // 실패하면 연속 종료로 오류를 보냅
                    // 연속에는 값 반환, 결과 반환 및 오류 발생을 위한 메서드가 존재
                    //
                case .failure(let error):
                    continuation.resume(throwing: error)
                    
                    // 성공하면 스크럼을 연속 폐쇄로 보냄
                    // 스크럼 배열은 비동기 작업이 재개될 때 withCheckedThrowingContinuation 호출의 결과가 됨
                case .success(let scrums):
                    continuation.resume(returning: scrums)
                }
            }
        }
    }
    
    // Int를 비동기적으로 반환하는 save라는 정적 함수를 만들어야함
    // 저장 함수는 함수 호출자가 사용할 수 없는 값을 반환
    // @discardableResult 속성은 사용되지 않은 반환 값에 대한 경고를 비활성화
    @discardableResult
    static func save(scrums: [DailyScrum]) async throws -> Int {
        // await 키워드를 사용하여 withCheckedThrowingContinuation을 호출
        try await withCheckedThrowingContinuation { continuation in
            // 클로저에서 완료 핸들러와 함께 레거시 저장 함수를 호출
            save(scrums: scrums) { result in
                // 섹션의 load 함수와 동일한 패턴에 따라 결과를 전환하여 함수를 끝냄
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let scrumsSaved):
                    continuation.resume(returning: scrumsSaved)
                }
            }
        }
    }
    
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
