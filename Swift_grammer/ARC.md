### ARC(Automatic Reference Counting)

Swift에서 앱의 메모리 사용을 관리하기 위한 것으로 자동으로 참조 횟수를 관리하기 때문에 개발자는 메모리 관리에 신경 쓸 필요가 없다.



#### 동작 방법

- 클래스의 새 인스턴스를 만들 때마다 ARC는 인스턴스 정보를 담는데 필요한 적정한 크기의 메모리를 할당

  이때 그 메모리는 인스턴스에 대한 정보와 관련된 저장 프로퍼티 값도 갖고 있다.

- 추가적으로 인스턴스가 더이상 사용되지 않을 때 ARC는 그 인스턴스가 차지하고 있는 메모리를 해지해서 다른 용도로 사용할 수 있도록 공간을 확보해둠

- 만약 ARC가 아직 사용중인 인스턴스를 메모리에서 내렸는데 인스턴스의 프로퍼티에 접근한다면 앱은 아마 크래시가 발생할 것이다.!

- ARC는 최소 하나라도 그 인스턴스에 대한 참조가 있는 경우 그 인스턴스를 메모리에서 해지 하지 않는다.



#### ARC의 사용

``` swift
class Person {
	let name: String
  
  //인스턴스 생성
	init(name: String) {
		self.name = name
		print("initialized")
	}
  
  //인스턴스 해지
	deinit {
		print("deinitialized")
	}
}

var reference1: Person?
var reference2: Person?
var reference3: Person?
//옵셔널 변수이기 때문에 초기값이 모두 nil을 갖고 있음

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
```

reference2, reference3 모두 처음에 reference1이 참조하는 Person 인스턴스를 참조하게 된다. Person 인스턴스에 대한 참조 횟수는 3이 된다. 

```swift
reference1 = nil
reference2 = nil
```

그리고 reference1, reference2 두 변수의 참조를 해지한다. 그러면 Person 인스턴스에 대한 참조 횟수는 아직 1이어서 Person 인스턴스는 해지되지는 않는다,,

```swift
reference3 = nil
```

Person 인스턴스를 참조하고 있는 reference3의 참조를 해지해주면 더이상 Person 인스턴스를 참조하는 것이 없어서 메모리에서 해지하게 된다.



#### 클래스 인스턴스간 강한 참조 순환

위에서는 ARC에서 기본적으로 참조 횟수에 대해 추적하고 있기 때문에 더이상 사용하지 않는 인스턴스는 자동으로 메모리에서 해제된다. 하지만 절대로 메모리에서 해제되지 않는 경우도 있다. 예를 들어 _클래스 인스턴스간 강한 참조 순환을 하는 경우_ 이다.

```swift
class Person {
	let name: String
	init(name: String) { self.name = name }
  var apartment: Apartment?
	deinit { print("deinitalized")}
}

class Apartment {
	let unit: String
	init(unit: String) { self.unit = unit }
	var tenant: Person?
	deinit { print("deinitalized")}
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apratment(unit: "4A")
```

이 코드의 흐름을 보면 

<code>var john</code> 에 대해선 Person 인스턴스로 name과 apartment가 있고

<code>var unit4A</code> 에 대해선 Apartment 인스턴스로 unit과 tenant가 있다

```swift
john!.apratment = unit4A
unit4A!.tenant = john
```

인스턴스 안의 apartment 와 tenant가 각각 Apartment, Person 인스턴스를 참조하고 있는 상황이 된다. 

Person 참조 횟수 = 2, Apartment 참조 횟수 = 2 가 된 상태이다.

```swift
john = nil
unit4A = nil
```

이제 인스턴스를 해지를 해보았다. 하지만 두 인스턴스는 해제되지 않는다.

Person인스턴스와 Apartment인스턴스의 변수가 각각 상호 참조를 하고 있어 참조 횟수가 1이기 때문에 이 두 인스턴스는 해지되지 않고 **메모리 누수**가 발생한다.



#### 클래스 인스턴스간 강한 참조 순환 문제의 해결

- weak 참조

  참조하고 있는 인스턴스가 먼저 메모리에서 해제될 때 사용

- unowned 참조

  참조하고 있는 인스턴스가 같은 시점 || 더 뒤에 해제될 때 사용

두 가지 모두 ARC에서 참조 횟수를 증가시키지 않고 인스턴스를 참조해서 강한 참조 순환 문제를 해결할 수 있다.



##### 약한 참조

약한 참조로 선언하게 되면 참조하고 있는 것이 먼저 메모리에서 해제되기 때문에 ARC는 약한 참조로 선언된 참조 대상이 해지되면 런타임에 자동으로 참조하고 있는 변수에 nil을 할당한다

```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
```

앞선 예제와 다른 점은 Apartment의 tenant 변수가 Person 인스턴스를 약한 참조로 참조하고 있다는 것.

```swift
john = nil //더 이상 Person 인스턴스를 참조하는 것이 없게됨!
```

john 이 해지된 후에

```swift
unit4A = nil // Apartment 인스턴스를 참조하는 개체도 사라지게되서 Apartment 인스턴스도 메모리에서 해지됨!
```



##### 미소유 참조

미소유 참조로 참조하게 되면 인스턴스가 현재 참조하고 있는 것같은 생애주기를 갖거나 더 긴 생애주기를 갖기 때문에 항상 참조에 그 값이 있다고 기대된다. 그래서 ARC는 미소유 참조에는 절대 nil을 할당하지 않는다

```swift
class Customer {
	let name: String
	var card: CreditCard?
	init(name: String) {
		self.name = name
	}
	deinit { print("deinitialized") }
}

class CreditCard {
  let number: UInt64
  unowned let cusomter: Cusomter
  init(number: UInt64, customer: Customer) {
  	self.number= number
    self.customer = customer
  }
  deinit{ print("deinitialized") }
}

var john: Customer?
john = Customer(name: "John")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
```

<code>john</code> 은 CreditCard 인스턴스, Customer 인스턴스를 참조하지만 미소유 참조를 하고 있기 때문에 Customer 인스턴스에 대한 참조 횟수는 1회이다



#### 미소유 참조와 암시적 옵셔널 프로퍼티 언래핑

약한 참조와 미소유 참조의 구분을 참조가 nil이 될 수 있느냐 없느냐의 차이라고 볼 수 있다. 하지만 이 경우를 제외한 제 3의 경우도 생길 수 있다. 이 경우에는 미소유 프로퍼티를 암시적 옵셔널 프로퍼티 언래핑을 사용해 참조 문제를 해결할 수 있다.

```swift
class Country {
	let name: String
  var capitalCity: City! //여기!
  init(name: String, capitalName: String) {
    self.name = name
    self.capitalCity = City(name: capitalName, country: self)
  }
}

class City {
  let name: String
  unowned let country: Country
  init(name: Stirng, country: Country) {
    self.name = name
    self.country = country
  }
}
```

Country의 capitalCity는 초기화 단계에서 City 클래스에 초기화 된 후 사용되게 된다. 즉 실제로 Country의 capitalCity는 옵셔널이 되어야한다. **하지만 여기서는 느낌표 연산자(!)를 이용해 명시적으로 강제 언래핑을 시켰다**. 암시적 언래핑이 돼서 Country에서 name을 초기화하는 시점에 self를 사용할 수 있게된다. 그리고 City에서는 강한 참조 순환을 피하기 위해 미소유 참조로 country를 선언해서 두 인스턴스를 문제없이 사용할 수 있다

