### Enum

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