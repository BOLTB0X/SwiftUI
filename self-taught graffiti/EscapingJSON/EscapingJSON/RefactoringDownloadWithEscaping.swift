//
//  RefactoringDownloadWithEscaping.swift
//  EscapingJSON
//
//  Created by KyungHeon Lee on 2023/03/30.
//

import SwiftUI

class RefaDownloadWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // URLSession에서 dataTask는 url을 전달하고, 데이터를 다시 가져옴
        // 그렇다면 많은 URL 주소로 data를 가져와야 사용해야한다면 계속해서 위 코드들은 계속 작업할 것
        // guard함수를 몇 번이고 계속 다시 작성하고 다시 호출을 반복
        
        // 이래서 URL관련 참고 소스를 보다보면 "비동기"에 대해 많이 접하게 됌
        
        // 원래 getPosts()함수의 작업과정은 앞에 작업을 끝나야 다른 작업이 시작되는 됌
        // 그래서 아예 data 생성 메소드를 만들어 비동기로 작업을 하게끔 코드를 작성해야함
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                // newPost는 옵셔널 이기 때문에 guard
                // 단일 포스트에서는 배열이 사용되지 않지만 2개 이상부턴 사용 됌
                // 그러므로 decode부분에서 []을 씌워줌
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("반환될 data X")
            }
        }
    }
    
    // @escaping클로저를 사용해야 하는데 이유는 비동기적인 것을 다운로드할 때 앱으로 돌아가는 시간이 있는데 실제로 조금의 시간이 걸리기 때문
    func downloadData(fromURL url: URL, complectionHandler: @escaping (_ data: Data?) -> ()) {
        //  데이터를 얻고 guard statement를 지나서 completionHandler를 호출하고 이곳에 data를 전달해줌
        //  그리고 guard statement를 보면 데이터에 데이터가 있고, error가 nil이 아니고, response이 정확히 된다면 completionHandler가 호출되로록 되어있음
        //  하지만 실패했다면 completionHandler가 nil이 되는 경우
        
        //  이제 guard문에 오류가 없다면 성공적으로 completionHandler가 실행될 것
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("data 다운로드 실패")
                    complectionHandler(nil)
                    return
            }
            complectionHandler(data)
        }
        .resume()
    }
}
