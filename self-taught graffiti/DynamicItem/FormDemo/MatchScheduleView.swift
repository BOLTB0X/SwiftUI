//
//  MatchScheduleView.swift
//  FormDemo
//
//  Created by lkh on 12/6/23.
//

import SwiftUI

struct MatchScheduleView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var btn: Bool = false
    let matchesData: [Match]
    
    init() {
        matchesData = Match.createDummyData()
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
                    ForEach(matchesData) { match in
                        MatchScheduleRow(date: match.date, img1: match.myTeamImgUrl, img2: match.awayImgUrl, state: match.isEnd)
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

struct MatchScheduleRow: View {
    @State private var imageLoading: Bool = true // 로딩 중인지 판단 용도

    let date:String
    let img1: String
    let img2: String
    let state: Bool
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack(alignment: .center, spacing: 20) {
                Text(date)
                    .font(.headline)
                Text(!state ? "경기전" : "경기종료")
                    .font(.subheadline)
            }
            
            HStack(alignment: .center, spacing: 0) {
                AsyncImage(url: URL(string: img1)) { image in
                    Link(destination: URL(string: img1)!, label: {
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                            .onAppear {
                                imageLoading = false // 가리기 취소
                            }
                    })
                    
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
                
                Spacer()
                
                AsyncImage(url: URL(string: img2)) { image in
                    Link(destination: URL(string: img2)!, label: {
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                            .onAppear {
                                imageLoading = false // 가리기 취소
                            }
                    })
                    
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
            }
        }
        .padding(.horizontal)
    }
}
#Preview {
    MatchScheduleView()
}
