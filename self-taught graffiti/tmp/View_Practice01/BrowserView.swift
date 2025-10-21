//
//  BrowserView.swift
//  View_Practice01
//
//  Created by KyungHeon Lee on 10/21/25.
//  https://www.appcoda.com/swiftui-webview/

import SwiftUI
import WebKit

struct BrowserView: View {
    @State private var page = WebPage()
    
    private let htmlContent: String = """
            <div class="videoFrame">
            <iframe width="960" height="540" src="https://www.youtube.com/embed/0_DjDdfqtUE?si=iYAmkvDghnGaVcAC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
            """
    
    var body: some View {
        WebView(page)
            .onAppear {
                page.load(html: htmlContent, baseURL: URL(string: "about:blank")!)
            }
    }
} // BrowserView

#Preview {
    BrowserView()
}
