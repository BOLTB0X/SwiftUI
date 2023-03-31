//
//  ModelsRowView.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import SwiftUI

// MARK: Model 가로 뷰
// List view의 하위 뷰
struct ModelsRowView: View {
    let model: APIRequest
    
    var body: some View {
        VStack {
            Text(model.name)
                .font(.title)
            Text("\(model.stargazers_count)")
            model
                .description
                .map(Text.init)?
                .font(.body)
        }
    }
}

// MARK: ModelsRow 미리보기
struct ModelsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ModelsRowView(model: APIRequest.getDummy().self)
    }
}
