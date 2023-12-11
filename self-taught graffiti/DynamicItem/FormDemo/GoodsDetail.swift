//
//  GoodsDetail.swift
//  FormDemo
//
//  Created by lkh on 12/6/23.
//

import SwiftUI
import WebKit

struct GoodsDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var urlToLoad: String
    
    var body: some View {
        NavigationView {
            WebView(urlToLoad: urlToLoad)
        }
        .navigationBarBackButtonHidden()
    }
}

struct WebView: UIViewRepresentable {
    var urlToLoad: String
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}

