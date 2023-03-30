//
//  DownloadWithEscaping.swift
//  EscapingJSON
//
//  Created by KyungHeon Lee on 2023/03/30.
//

import SwiftUI

// MARK: ViewModel
class DownloadWithEscapingViewModel: ObservableObject{
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() { // 사람들마다 fetch라고도 함
        // URL을 만들 떄 옵셔널로 나옴
        // 그래서 gaurd let 사용
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {return}
        
        URLSession.shared
        // 인터넷을 사용하기 위한 코드 dataTask의 completionHandler을 사용
        // http 통신으로 url에 있는 모든 data를 다운로드 할 수 있는 것임
        // 이 메서드 특성상 다운로드를 받고 돌아오면 data, response, error 중 하나를 실행
            .dataTask(with: url) { data, response, error in
                // dataTask 동작
                // 먼저 data, response, error를 확인
                // 마지막으로 작업의 맨 아래에 .resume()을 추가해서 실제로 호출할 때까지 시작되지 않도록 설정
                // 저 1. data = data의 존재 유무 확인, 2. response = http 응답을 받음, ㄷ. error = error확인 가 응하도록 code를 작성해야 함
                
                // 1. data 확인
                guard let data = data else {
                    print("data X")
                    return
                }
                
                // 2. error 확인
                guard error == nil else {
                    print("오류: \(String(describing: error))")
                    return
                }
                
                // 3. http 통신을 통한 response
                guard let response = response as? HTTPURLResponse else {
                    print("잘못된 response")
                    return
                }
                
                // 4. 응답 상태 확인
                // //Successful response = 200 ~ 299
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    print("현재 Status Code: \(response.statusCode)")
                    return
                }
                print("data 다운로드 성공")
                print(data) // 여기가 @Publishe부터 성공한 data를 출력해줬던 것
                
                // 다운 받은 data를 사용하기 위해 String으로 변환
                let jsonString = String(data: data, encoding: .utf8)
                print(jsonString)
                
                // newPost또한 옵셔널 -> guard 이용
                guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts.append(newPost)
                }
                // Thread 게시글을 보면 인터넷에서 다운로드하는 데이터는 background Thread에서 실행되고 UI를 업데이트하는 곳은 Main Thread에서 실행됨 여기서 인터넷에서 다운로드하는 곳은 바로 dataTask 부분이 되며 실제로 background Thread로 이동
            }
            .resume()
        // 위 과정이 데이터를 확인 -> 오류 확인 -> 응답을 받고 -> 응답 상태를 확인 후 -> 데이터를 출력
        // getPosts를 init에 호출해주고 실제로 사용할 Json Data url를 가져와야함(fetch)
    }
}
