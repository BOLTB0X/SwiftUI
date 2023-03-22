# Alamofire

> 비동기로 수행하는 swift기반의 HTTP 네트워킹 라이브러리(통신 라이브러리)

\* cf. HTTP \*
<br/> \* 웹상에서 클라이언트와 서버 간에 요청/응답으로 데이터를 주고 받을 수 있는 프로토콜 웹상에서 클라이언트와 서버 간에 요청/응답으로 데이터를 주고 받을 수 있는 프로토콜\*
<br/>

## 정리하게 된 계기

앱 개발을 하다보면 view의 data를 서버에서 받아와야하는 경우가 거의 90% 서버에서 json형식의 data를 받아오려면 HTTP 통신을 해야함
<br/>
apple에서 제공하는 URLSession도 있지만 많은 사람들이 Alamofire 통신 라이브러리를 이용함
<br/>

## alamofire이용하는 이유

1. Foundation 프레임워크에서 제공하는 URL 로딩 시스템을 기반으로 구축된 것이 'Alamofire'
   URLSession 및 URLSessionTask 같은 클래스가 쉽게 구현되어 있음
   <br/>
2. CocoaPods를 통해 간단하게 설치 가능
   <br/>

## 보편적으로 많이 사용하는 메서드

\*\*AF.request(URL, method,encoder, headers, interceptor)\*\*
<br/>
DataRequest를 생성, 그 안에 개별 구성(method, parameter) 요청 -> 요청마다 Encodable을 만족하는 Parameter 허용하는 것
<br/>
Alamofire의 모든 URLRequestConvertible 프로토콜을 준수하는 모든 type에 대한 DataRequest를 생성
<br/>

## HTTP Method

HTTP 통신으로 원하는 것을 가져오거나 게시 등 하는 것이 get, post, put, delete
<br/>

- GET: 서버로부터 정보를 조회하기 위해 설계된 메소드

- POST: 리소스를 생성/변경하기 위해 설계되었기 때문에 GET과 달리 전송해야될 데이터를 HTTP 메세지의 Body에 담아서 전송

## Parameters

Alamofire라는 통신 라이브러리는 기본적으로 모든 Encodable type값을 request의 매개변수로 사용하는 것을 허용
<br/>
Encoder: Encodable 객체를 JSON이나 XML와 같은 다른 형식으로 변경하는 작업을 수행하는 인코더의 프로토콜
<br/>
parameter가 없는 경우는 nil을 할당
<br/>

## Headers

서버 보안상 보안상 안전한 사용자에게만 data를 준다고 할때 이를 구분하는 것이 Header
<br/>
Http header에 Authorization이란 key값으로 서버에게 "나 안전해~"를 담은 value을 보냄
<br/>

## Respone

요청을 했으면 이에 대한 응답은

```swift
AF.request(url).response()
// 요런 형대로 받음
```

응답을 받는 방법은 Alamofire에서는 총 6가지 방법이 있음 -> 이를 response handler
<br/>

1. response handler: URLSessionDelegate(URLSession 인스턴스가 세션 수준의 이벤트를 처리하기 위해 Delegate에서 호출하는 메서드를 정의하는 프로토콜)에서 직접 모든 정보를 전달하고 응답 data를 평가 X

```swift
AF.request(url) res in {
     print(res)
}
```

2. responseData Handler: DataResponseSerializer를 사용해 서버에서 반환된 데이터를 추출하고 유효성 검사를 진행

```swift
AF.request(url).responseData { response in
print(response)
}
```

3. responseString Handler: StringResponseSerializer를 사용해 서버에서 반환된 데이터를 지정된 인코딩을 사용하는 문자열로 변환
   만약, 인코딩이 지정되지 않은 경우 Alamofire는 서버의 HTTPURLResponse에 지정된 텍스트 인코딩을 사용StringResponseSerializer : 응답 데이터를 문자열로 디코딩하는 ResponseSerializer.
   <br/>

```swift
AF.request(url).resonseString { response in print(response) }
```

4. responseJSON
   JSONResponseSerializer를 사용해 서버에서 반환된 데이터를 지정된 JSONSerialization.ReadingOptions를 사용하는 Any타입으로 변환한다. JSONResponseSerializer : JSONSerialization을 사용하여 응답 데이터를 디코딩하는 ResponseSerializer.
   <br/>
   JSONSerialization.ReadingOptions : JSON 데이터에서 Foundation 개체를 만들 때 사용되는 옵션
   <br/>

5. responseDecodable Handler DecodableResponseSerializer를 사용해 서버에서 반환된 데이터를 지정된 DataDecoder을 사용하는 Decodable타입으로 변환
   DecodableResponseSerializer : DataDecoder를 따르는 모든 타입을 사용해 응답 데이터를 제네릭 값으로 디코딩하는 ResponseSerializer. DataDecoder : 데이터를 Decodable타입으로 디코딩 할 수 있는 모든 타입
   <br/>

## Validation

유효성검사는 요청에 대한 response를 하기 전에 .validate()를 호출함으로써 유효하지 않은 상태 코드나 MIME타입이 있는 경우 response x
<br/>

```swift
AF.request(url)
  .validate()
  .response { response in
     print(response)
}

AF.request(url)
  .validate(200..<300) // 200~300 사이 상태코드만 허용
  .validate(contentType:["application/json"]) // JSON 포맷만 허용
  .response { response in
      print(response)
}
// 주석처럼 위 코드는 해당 URL에 대한 응답 처리를 상태코드가 200~300이면서 JSON 포맷일 때 응답처리를 한다.
```

---

[API 연동](https://github.com/BOLTB0X/SwiftUI/tree/main/study/Alamofire/practiceAlamofire)

---

## 참고

https://velog.io/@simh3077/URLSession과-Alamofire를-비교해보자.-with-SwiftUI
<br/>

https://github.com/Alamofire/Alamofire
<br/>

https://velog.io/@simh3077/URLSession과-Alamofire를-비교해보자.-with-SwiftUI
<br/>
