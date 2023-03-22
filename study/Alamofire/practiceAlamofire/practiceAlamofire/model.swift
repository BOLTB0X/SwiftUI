//
//  model.swift
//  practiceAlamofire
//
//  Created by KyungHeon Lee on 2023/03/22.
//

import Foundation

struct UserDatas: Codable {
    var results: [RandomUser]
}

// RandomUserAPI로부터 넘어오는 JSON 데이터의 구조를 맞추기위해 파싱하기 위한 구조
struct RandomUser: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let email: String
    
    struct Name: Codable {
        var title: String
        var first: String
        var last: String
        
        var full: String {
            return "\(self.title.capitalized).\(self.last.capitalized) \(self.first.capitalized)"
        }
    }
    
    static func getDummy() -> Self {
        return RandomUser(name: Name.init(title: "ahahahaahahaahahahahhahahahahahahaha", first: "kh", last: "Lee"), email: "cxzcxzczcxzcsc@gmail.com")
    }
}
