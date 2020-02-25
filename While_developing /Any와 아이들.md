### Any를 사용하는 경우

```swift
let attribute: [NSAttributedStringKey: Any]
```

attributes의 값이 UIColor, UIFont로 알 수 있기 때문에 any를 사용할 수 있다. 

그럼 Any를 어떻게 사용할까?

1. 반드시 내가 아는 타입으로 바꿔줘야한다.

   __이때 as?를 사용해야한다__

   __as?__ 는 Any를 명시한 타입으로 변환되고 불가능할 경우 nil을 리턴

----

### As를 사용한 타입 변환

- 어떠한 변수 타입을 서브클래스 중 하나로 바꿀 수 있다.

  ```swift
  if let cvc = vc as? ConcentrationViewController{
  //하위변환형
  }
  ```

----

### Other interesting Class

1. NSObject

   :Object-C의 모든 클래스의 루트 클래스이다.

2. NSNumber

3. Date

4. Data