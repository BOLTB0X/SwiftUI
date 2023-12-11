//
//  Model.swift
//  FormDemo
//
//  Created by lkh on 12/6/23.
//

import Foundation

struct Goods: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let imgUrl: String
    let orgUrl: String
    let state: String
    
    init(title: String, price: String, imgUrl: String, orgUrl: String, state: String) {
        self.title = title
        self.price = price
        self.imgUrl = imgUrl
        self.orgUrl = orgUrl
        self.state = state
    }
    
    static func createDummyData() -> [Goods] {
        let dummyData = [
            Goods(title: "NIKE 토트넘 23/24 STADIUM HOME KIT [프리미어리그]", price: "149,000원", imgUrl: "https://superiorsoccerstore.com/web/product/big/202306/67b8238bb1b856910abbd2299d628a63.png", orgUrl:"https://superiorsoccerstore.com/product/nike-%ED%86%A0%ED%8A%B8%EB%84%98-2324-stadium-home-kit-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%96%B4%EB%A6%AC%EA%B7%B8/2228/", state: "Y"),
            Goods(title: "NIKE 토트넘 23/24 STADIUM THIRD KIT [프리미어리그]", price: "149,000원", imgUrl: "https://superiorsoccerstore.com/web/product/big/202309/895d025c145667584efc92ebd5c642e6.png", orgUrl:"https://superiorsoccerstore.com/product/nike-%ED%86%A0%ED%8A%B8%EB%84%98-2324-stadium-third-kit-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%96%B4%EB%A6%AC%EA%B7%B8/2440/category/124/display/1/", state: "Y"),
            Goods(title: "토트넘 'VERTIGO' 스카프 (머플러) - 오피셜", price: "38,000원", imgUrl: "https://superiorsoccerstore.com/web/product/big/202310/15289f88135dcac759d73465b4f9a104.jpg", orgUrl:"https://superiorsoccerstore.com/product/%ED%86%A0%ED%8A%B8%EB%84%98-vertigo-%EC%8A%A4%EC%B9%B4%ED%94%84-%EB%A8%B8%ED%94%8C%EB%9F%AC-%EC%98%A4%ED%94%BC%EC%85%9C/2626/category/102/display/1/", state: "Y"),
            Goods(title: "NIKE 토트넘 23/24 STADIUM AWAY KIT [프리미어리그]", price: "149,000원", imgUrl: "https://superiorsoccerstore.com/web/product/big/202311/f22155539a1ed7ea9878f8b1a1c26432.png", orgUrl:"https://superiorsoccerstore.com/product/nike-%ED%86%A0%ED%8A%B8%EB%84%98-2324-stadium-away-kit-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%96%B4%EB%A6%AC%EA%B7%B8/2662/category/124/display/1/", state: "N"),
            Goods(title: "[토트넘 홋스퍼 공식 굿즈] 스퍼스 리사이클 클래식 베어 곰인형 미디움", price: "52,300원", imgUrl: "https://img.croket.co.kr/item/contents/132ccdf2f3251dcc9642236afe19e4c4.jpeg", orgUrl:"https://www.croket.co.kr/seller/product/64f5ad4d10dd4a0081e17799?yg_type=web_sameseller&yg_method=64f5ad4d10dd4a0081e17799", state: "N")
        ]
        return dummyData
    }
}

struct Match: Identifiable {
    let id = UUID()
    let date: String
    let myTeam: String
    let myTeamImgUrl: String
    let away: String
    let awayImgUrl: String
    let isEnd: Bool
    
    init(date: String, myTeam: String, myTeamImgUrl: String, away: String, awayImgUrl: String, isEnd: Bool) {
        self.date = date
        self.myTeam = myTeam
        self.myTeamImgUrl = myTeamImgUrl
        self.away = away
        self.awayImgUrl = awayImgUrl
        self.isEnd = isEnd
    }
    
    static func createDummyData() -> [Match] {
        let dummyData = [
            Match(date: "12.04 월 (01:30)", myTeam: "토트넘", myTeamImgUrl: "https://blog.kakaocdn.net/dn/xN2uP/btqRrRdFodp/eg60yRdaplkv9n1I93tySk/img.png", away: "맨시티", awayImgUrl: "https://e7.pngegg.com/pngimages/287/555/png-clipart-manchester-city-f-c-manchester-city-w-f-c-premier-league-2011-fa-cup-final-premier-league-text-trademark.png", isEnd: false),
            Match(date: "12.08 금 (05:15)", myTeam: "토트넘", myTeamImgUrl: "https://blog.kakaocdn.net/dn/xN2uP/btqRrRdFodp/eg60yRdaplkv9n1I93tySk/img.png", away: "웨스트햄", awayImgUrl: "https://w7.pngwing.com/pngs/717/1010/png-transparent-west-ham-united-f-c-logo-emblem-football-mascot-west.png", isEnd: false),
            Match(date: "12.11 월 (05:00)", myTeam: "토트넘", myTeamImgUrl: "https://blog.kakaocdn.net/dn/xN2uP/btqRrRdFodp/eg60yRdaplkv9n1I93tySk/img.png", away: "뉴캐슬", awayImgUrl: "https://e1.pngegg.com/pngimages/807/155/png-clipart-team-logos-newcastle-united-logo-thumbnail.png", isEnd: false),
            Match(date: "12.24 월 (00:00)", myTeam: "토트넘", myTeamImgUrl: "https://blog.kakaocdn.net/dn/xN2uP/btqRrRdFodp/eg60yRdaplkv9n1I93tySk/img.png", away: "노팅엄 포레스트", awayImgUrl: "https://e7.pngegg.com/pngimages/761/415/png-clipart-nottingham-forest-f-c-fa-cup-english-football-league-west-bromwich-albion-f-c-premier-league.png", isEnd: false)
            
        ]
        return dummyData
    }
}

struct EPLTeamInfo: Identifiable {
    let id = UUID()
    let name: String
    let img: String
    
    static func createDummyData() -> [EPLTeamInfo] {
        let dummyData = [
        EPLTeamInfo(name: "노팅엠", img: "https://e7.pngegg.com/pngimages/761/415/png-clipart-nottingham-forest-f-c-fa-cup-english-football-league-west-bromwich-albion-f-c-premier-league.png"),
        EPLTeamInfo(name: "뉴캐슬", img: "https://upload.wikimedia.org/wikipedia/ko/thumb/8/84/%EB%89%B4%EC%BA%90%EC%8A%AC_%EC%9C%A0%EB%82%98%EC%9D%B4%ED%8B%B0%EB%93%9C_FC_%EB%A1%9C%EA%B3%A0.svg/1016px-%EB%89%B4%EC%BA%90%EC%8A%AC_%EC%9C%A0%EB%82%98%EC%9D%B4%ED%8B%B0%EB%93%9C_FC_%EB%A1%9C%EA%B3%A0.svg.png"),
        EPLTeamInfo(name: "루턴 다운", img: "https://www.vintagefootballshirts.com/uploads/teams/images/luton-town-133.jpg"),
        EPLTeamInfo(name: "리버풀", img: "https://www.vintagefootballshirts.com/uploads/teams/images/luton-town-133.jpg"),
        EPLTeamInfo(name: "맨시티", img: "https://e7.pngegg.com/pngimages/287/555/png-clipart-manchester-city-f-c-manchester-city-w-f-c-premier-league-2011-fa-cup-final-premier-league-text-trademark.png"),
        EPLTeamInfo(name: "맨유", img: "https://w7.pngwing.com/pngs/997/289/png-transparent-manchester-united-logo-food-text-sport.png"),
        EPLTeamInfo(name: "아스톤빌라", img: "https://upload.wikimedia.org/wikipedia/ko/3/35/%EC%95%A0%EC%8A%A4%ED%84%B4_%EB%B9%8C%EB%9D%BC_FC_%EB%A1%9C%EA%B3%A0.png"),
        EPLTeamInfo(name: "토트넘", img: "https://blog.kakaocdn.net/dn/xN2uP/btqRrRdFodp/eg60yRdaplkv9n1I93tySk/img.png"),
        EPLTeamInfo(name: "첼시", img: "https://upload.wikimedia.org/wikipedia/ko/thumb/a/ae/Chelsea_FC_Logo.svg/1200px-Chelsea_FC_Logo.svg.png"),
        EPLTeamInfo(name: "아스날", img: "https://w7.pngwing.com/pngs/13/464/png-transparent-arsenal-f-c-premier-league-football-emirates-stadium-logo-arsenal-f-c-emblem-label-logo.png"),
        EPLTeamInfo(name: "울버햄튼", img: "https://w7.pngwing.com/pngs/494/916/png-transparent-wolverhampton-wanderers-english-football-club-icon.png"),
        EPLTeamInfo(name: "브라이튼", img: "https://w7.pngwing.com/pngs/195/233/png-transparent-falmer-stadium-brighton-hove-albion-f-c-premier-league-liverpool-f-c-manchester-united-f-c-premier-league-marine-mammal-text-logo-thumbnail.png")
        ]
        
        return dummyData
    }
}
