//
//  ContentView.swift
//  CustomPopUp
//
//  Created by KyungHeon Lee on 2023/06/12.
//

import SwiftUI

struct ContentView: View {
    @State var showPopup = false
    
    var body: some View {
        NavigationView {
            Button("팝업") {
                withAnimation {
                    showPopup.toggle()
                }
            }
            .navigationTitle("Custom PopUp")
        }
        .popupNavigationView(horizontalPadding: 40, show: $showPopup) {
            TempView()
            
                .navigationTitle("PopUp")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Close") {
                            withAnimation {
                                showPopup.toggle()
                            }
                        }
                    }
                }
        }
    }
}

extension View {
    // MARK: Building modifier for custom popups
    func popupNavigationView<Content: View>(horizontalPadding: CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content) -> some View {
        return self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay {
                if show .wrappedValue {
                    // MARK: Reading container frame
                    GeometryReader { proxy in
                        
                        Color.primary
                            .opacity(0.15)
                            .ignoresSafeArea()
                        
                        let size = proxy.size
                        
                        NavigationView {
                            content()
                        }
                        .frame(width: size.width - horizontalPadding, height: size.height / 1.7, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
