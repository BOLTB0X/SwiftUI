//
//  GoodsListView.swift
//  FormDemo
//
//  Created by lkh on 12/6/23.
//

import SwiftUI

struct GoodsListView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var btn: Bool = false
    let goodsData: [Goods]
    
    init() {
        goodsData = Goods.createDummyData()
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 0) {
                Button(btn ? "최신순" : "정확도순") {
                    btn.toggle()
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                
                List {
                    Section(header: Text("실시간").font(.subheadline)) {
                        ForEach(goodsData.filter { $0.state == "Y" }) { item in
                            NavigationLink(destination: GoodsDetail(urlToLoad: item.orgUrl)) {
                                GoodsListRow(title: item.title, price: item.price, imgUrl: item.imgUrl, orgUrl: item.orgUrl)
                            }
                           
                        }
                    }
                    
                    Section(header: Text("발매예정").font(.subheadline)) {
                        ForEach(goodsData.filter { $0.state == "N" }) { item in
                            NavigationLink(destination: WebView(urlToLoad: item.orgUrl)) {
                                GoodsListRow(title: item.title, price: item.price, imgUrl: item.imgUrl, orgUrl: item.orgUrl)
                                    .navigationBarBackButtonHidden()
                                
                            }
                        }
                    }
                }
                .listStyle(.inset)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("<")
                        .foregroundColor(.black)
                        .bold()
                }
            }
        }
    }
}

struct GoodsListRow: View {
    @State private var imageLoading: Bool = true // 로딩 중인지 판단 용도
    
    let title: String
    let price: String
    let imgUrl: String
    let orgUrl: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AsyncImage(url: URL(string: imgUrl)) { image in
               
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .onAppear {
                            imageLoading = false // 가리기 취소
                        }
                
                
            } placeholder: {
                Image("free-icon-gallery")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .onAppear {
                        imageLoading = true // 가리기
                    }
                    .redacted(reason: .placeholder)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                if imageLoading {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                        .lineLimit(3)
                        .redacted(reason: .placeholder)
                } else {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                        .fontWeight(.bold)
                        .bold()
                        .lineLimit(3)
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    // 로딩 줄일때
                    if imageLoading {
                        Spacer()
                        Text("Loading...")
                            .lineLimit(1)
                            .fontWeight(.bold)
                            .redacted(reason: .placeholder)
                    }
                    else {
                        Text(price)
                            .font(.system(size: 10, weight: .bold))
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(8)
    }
}


#Preview {
    GoodsListView()
}
