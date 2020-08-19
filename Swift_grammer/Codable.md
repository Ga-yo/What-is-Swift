### Codable

> Swift/boostcourse3.md 에 있는 Codable에 대해 자세히 설명하고자

- Encodable 이란?

  : data를 Encoder에서 변환해주려는 프로토콜로 바꿔주는 것

- Decodable 이란?

  : data를 원하는 모델로 Decode 해주는 것

- Codable이란?

  : Encodable + Decodable

  - Ex) json

    Encodable = 모델을 json으로 인코드

    Decodable = json을 내가 원하는 모델로 디코드

  **Struct, enum, class 전부 채택 가능**

```swift
typealias Codable = Decodable & Encodable
```



- Encoding

  ```swift
  struct Person: Codable{
  	var name: String
  	var age: Int
  }
  ```

  이렇게 해주고 JSON으로 변환해줄거에용

  ```swift
  let encoder = JSONEncoder()
  +
  let addInstance = Person(name: "gayo", age: 100)
  ```

  이렇게 해주면 Encode는

  ```swift
  let jsonData = try? encoder.encode(addInstance)
  
  if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8){
    print(jsonString) //{"name":"gayo","age":100}
  }
  ```

  만약 여기서 프린트 타입을 이쁘게 출력하고싶다면

  ```swift
  encoder.outputFormatting = .prettyPrinted
  ```

- Decoding

  위에서 encoding한 것을 decoding 해봅시당

  ```swift
  let decoder = JSONDecoder()
  var data = jsonString.data(using: .utf8)
  ```

  이제 데이터를 인스턴스로 ~

  ```swift
  if let data = data, let myPerson = try? decoder.decode(Person.self, from: data){
  	print(myPerson.name) //gayo
  }
  ```

  

