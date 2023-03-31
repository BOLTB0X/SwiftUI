//
//  ModelsListView.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import SwiftUI
import Combine

// MARK: Row뷰의 상위 뷰이자 ConatinerView의 하위 뷰
struct ModelsListView: View {
    let models: [APIRequest]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
        List {
            ForEach(models) { model in
                ModelsRowView(model: model)
                    .onAppear {
                        if self.models.last == model {
                            self.onScrolledAtBottom()
                        }
                    }
            }
        }
    }
}

// 샘플
struct ModelsListView_Previews: PreviewProvider {
    static var previews: some View {
        ModelsListView(models: [APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,
                                APIRequest.getDummy().self,APIRequest.getDummy().self], isLoading: false) {
            
        }
    }
}
