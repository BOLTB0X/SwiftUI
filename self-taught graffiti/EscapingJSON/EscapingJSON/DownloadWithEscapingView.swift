//
//  DownloadWithEscapingView.swift
//  EscapingJSON
//
//  Created by KyungHeon Lee on 2023/03/30.
//

import SwiftUI

struct DownloadWithEscapingView: View {
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.posts) { post in
                VStack(spacing: 10) {
                    Text(post.title)
                        .font(Font.title.bold())
                    Text(post.body)
                        .foregroundColor(Color(UIColor.systemGray2))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
    }
}

struct DownloadWithEscapingView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscapingView()
    }
}
