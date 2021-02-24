### 메소드 Method

메소드란 특정 타입의 클래스, 구조체, 열거형과 관련된 함수를 메소드라고 한다. 

특정 타입의 인스턴스에서 실행할 수 있는 메소드를 *인스턴스 메소드*

특정 형과 관련된 메소드를 *타입 메소드*

### 인스턴스 메소드 instance methods

특정 클래스, 구조체, 열거형의 인스턴스에 속한 메소드이다. 메소드를 통해 인스턴스 내의 값을 제어하거나 변경할 수 있다. 인스턴스 메소드는 이름 그대로 그 인스턴스가 속한 특정 타입의 인스턴스에서만 실행 가능하다

```swift
class Counter {
	var count = 0
  func increment() {
    count += 1
  }
  
  func increment(by amount: Int) {
    count += amount
  }
  
  func reset() {
    count = 0
  }
}
```

여기서 보이는 <code> increment</code> , <code>increment(by:)</code>, <code>reset</code> 은 모두 인스턴스 메소드이다.



#### Self 프로퍼티

모든 프로퍼티는 암시적으로 인스턴스 자체를 의미하는 **self**라는 프로퍼티를 갖는다. 인스턴스 메소드 안에서 self 프로퍼티를 이용해 인스턴스 자체를 참조하는데 사용할 수 있다.

만약 인자 이름이 프로퍼티 이름과 같은 경우에는 프로퍼티에 접근하기 위해 명.시.적으로 self 키워들르 사용해야한다.



#### 인스턴스 메소드 내에서 값 타입 변경

구조체와 열거형은 값 타입이다. 그래서 기본적으로 인스턴스 메소드 내에서 값 타입의 프로퍼티를 변경할 수 없다. 하지만 값 타입 형의 메소드에서 프로퍼티를 변경하고 싶을 때에는 어떻게 해야할까? 그때 <code>mutating</code> 붙여주면된다. <code>mutating</code> 이라는 키워드가 붙은 메소드에선 메소드의 계산이 끝난 후 원본 구조체에 그 결과를 덮어 써서 그 값을 변경한다!

```swift
struct Point {
  var x = 0.0, y = 0.0
  mutating func moveBy(x deltaX: Double, y deltaY: Double) {
    x += deltaX
    y += deltaY
  }
  
  var somePoint = Point(x: 1.0, y: 1.0)
  somePoint.moveBy(x: 2.0, y: 3.0)
}
```



#### Mutating 메소드 내에서 self 할당

```swift
struct Point {
  var x = 0.0, y = 0.0
  mutating func moveBy(x deltaX: Double, y deltaY: Double) {
    self = Point(x: x + deltaX, y: y + deltaY)
  }
}
```

이렇게도 새로운 인스턴스 생성이 가능하다





### 타입 메소드

인스턴스 메소드는 특정 타입의 인스턴스에서 호출

타입 메소드는 특정 타입 자체에서 호출



타입 메소드 사용 방법!

```swift
class SomeClass{
  class func someTypeMethod() {
    
  }
}
someClass.someTypeMethod()
```

타입 메소드 안에서도 self를 사용할 수 있다. 하지만 그때 self는 인스턴스가 아니라 타입 자신을 의미한다.



- static 메소드 : 서브 클래스에서 오버라이드 X

  ```swift
  struct LevelTracker {
      static var highestUnlockedLevel = 1
      var currentLevel = 1
  
      static func unlock(_ level: Int) {
          if level > highestUnlockedLevel { highestUnlockedLevel = level }
      }
  
      static func isUnlocked(_ level: Int) -> Bool {
          return level <= highestUnlockedLevel
      }
  
      @discardableResult
      mutating func advance(to level: Int) -> Bool {
          if LevelTracker.isUnlocked(level) {
              currentLevel = level
              return true
          } else {
              return false
          }
      }
  }
  ```

- class 키워드 : 서브 클래스에서 오버라이드 O