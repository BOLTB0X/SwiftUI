//
//  InfiniteListScrollApp.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import SwiftUI

@main
struct InfiniteListScrollApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ModelsViewModel())
        }
    }
}
