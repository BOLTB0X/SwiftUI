//
//  DynamicTabView.swift
//  DynamicTabView
//
//  Created by KyungHeon Lee on 2023/02/23.
//

import SwiftUI

struct DynamicTabView: View {
    // 뷰모델
    @StateObject private var viewModel = DynamicTabViewModel()
    
    var body: some View {
        NavigationView {
            // 탭뷰
            TabView {
                // Foreach로 가로로 하나씩
                ForEach(viewModel.tabItems) { item in
                    Text(item.name)
                        .font(.largeTitle)
                        .tabItem {
                            Label(item.name, systemImage: item.image)
                        }
                        .tag(item.tag)
                }
            }
            .navigationTitle("Dynamic Tab View")
            .navigationBarItems(leading: Button(action: viewModel.addTabItem) {
                Text("Add")
            }, trailing: Button(action: viewModel.removeTabItem) {
                Text("Remove")
            })
        }
    }
}

struct DynamicTabView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTabView()
    }
}
