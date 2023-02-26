//
//  DynamicTabViewModel.swift
//  DynamicTabView
//
//  Created by KyungHeon Lee on 2023/02/23.
//

import SwiftUI
import Combine

// viewmodel
final class DynamicTabViewModel: ObservableObject {
    @Published var tabItems: [TabItem] = []
    @Published var tabCount = 1
    
    func addTabItem() {
        tabItems.append(TabItem(name: " Tab \(tabCount)", image: "0\(tabCount).square", tag: tabCount))
        tabCount += 1
    }
    
    func removeTabItem() {
        tabItems.removeLast()
        tabCount -= 1
    }
}
