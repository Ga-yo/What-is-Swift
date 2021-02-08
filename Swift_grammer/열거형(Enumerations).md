### 열거형(Enumerations)

> 열거라는 뜻 (Enumeration)

- 1월부터 12월까지를 정의해보자

```swift
enum Month: Int{
	case january = 1
  case february
  case march
  case april
  case may
  case june
  case july
  case august
  case september
  case october
  case november
  case december
  
  func simpleDescription() - > String{
    switch self{
      case .january:
      return "1월"
      case .february:
      return "2월"
      case .march:
      return "3월"
      case .april:
      return "4월"
      case .may:
      return "5월"
      case .june:
      return "6월"
      case .july:
      return "7월"
      case .august:
      return "8월"
      case .setember:
      return "9월"
      case .october:
      return "10월"
      case .november:
      return "11월"
      case .december:
      return "12월"
    }
  }
}

let december = Month.december
print(december.simpleDescription())
print(december.rawValue) //원시 값
```

<code>rawValue</code> 속성은 원시값을 나타낸다.



#### ?! 옵셔널은 Enum ?!

실제로 옵셔널은

```swift
 public enum Optional<Wrapped>{
 	case none
 	case some(Wrapped)
 }
```



### 관련 값(Associated Values)

관련 값을 이용해서 같은 형이지만 다른 형태의 값을 갖는 case를 만들 수 있다.

```swift
enum Barcode {
	case upc(Int, Int, Int, Int)
	case qrCode(String)
}
```

Case 안의 관련 값이 전부 상수이거나 변수이면 공통된 값을 case뒤에 선언해서 보다 간결하게 기술 할 수 있다.



### Raw 값(Raw Values)

C와 Objective-C와 같이 case에 raw를 지정할 수 있다

```swift
enum ASCIIControlCharacter: Character {
	case tab = "\t"
	case lineFeed = "\n"
	case carriageReturn = "\r"
}
```



#### 암시적으로 할당된 Raw 값

열거형을 다루면서 raw값으로 integer나 string을 사용할 수 있는데 각 case 별로 명시적으로 raw값을 할당할 필요는 없다. 만약 할당하지 않았더라도 Swift에서 자동으로 값을 할당해준다.

```swift
enum Planet: Int {
	case mercury = 1, venus, earth, mars, jupiter
}
```

case mercury에 1을 raw값으로 명시적으로 할당했고 venus는 암시적으로 2 그리고 이후 값은 1증가된 값을 자동으로 raw값으로 갖게 된다 

그렇다면 Int가 아닌 String일 때는 어떨까? 바로 Case 텍스트가 raw 값으로 자동으로 raw값으로 할당된다



#### Raw 값을 이용한 초기화

Raw 값을 이용해 열거형 변수를 초기화 할 수 있다. 

```swift
let possibleInit = Planet(rawValue: 7)
```

만약 열거형에 지정된 raw값이 없는 값으로 지정하면 그 값은 nil이 된다



#### 재귀 열거자

다른 열거 인스터스를 관계 값으로 갖는 열거형으로 case 앞에 indirect 키워드를 붙여 표시한다

```swift
enum RecursiveExpression {
	case number(Int)
	indirect case addition(ResursiveExpression, ResursiveExpression)
}
```

