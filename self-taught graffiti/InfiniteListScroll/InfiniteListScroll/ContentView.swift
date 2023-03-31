//
//  ContentView.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import SwiftUI

// MARK: 최상위 뷰
// viewModel과 연결되는 최상위 뷰
struct ContentView: View {
    @ObservedObject var viewModel: ModelsViewModel
    
    var body: some View {
        // 하위 뷰인 리스트뷰에 viewModel 인스턴스를 매개변수로 연결
        ModelsListView(
            models: viewModel.cur.model,
            isLoading: viewModel.cur.LoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPossible
        )
        .onAppear(perform: viewModel.fetchNextPossible)
    }

}

// 샘플
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ModelsViewModel())
    }
}
