### CGAffineTransform

<code> CGAffineTransform</code> 은 구조체이다. 2D 그래픽을 그릴 수 있다. 먼저 UIView를 생성해준다.

```swift
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let myView = UIView(frame: rect)
view.addSubview(myView)
```

CGAffineTransform을 사용하기 전에 3가지 구성 요소를 알아봐야한다.

1. scale - 뷰의 넓이 와 높이를 두 배로 증가
2. rotationAngle - 뷰를 180도로 회전
3. Translation - 뷰의 위치를 x 200, y 200 으로 움직임

```swift
UIView.animate(withDuration: 2.0){
	myView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
}
UIView.animate(withDuration: 2.0){
	myView.transform = CGAffineTrasform(rotationAngle: .pi)
}
UIView,animate(withDuration: 2.0){
	myView.transform = CGAffineTransform(translationX: 200, y: 200)
}
```

------

### UIView.animate

iOS에서 Animation 방법은 UIView.animate이다.

#### Animate

- 특징

  - 클로져기반
  - 애니메이션이 동작하는 동안 user interaction은 일시적으로 disabled
  - 애니메이션이 가능한 속성 -> frame, bounds, center, transform, alpha, backgroundColor

- 구현 방법

  - animate(withDuration: animations:)

    =>애니메이션의 기본 메서드

  - animate(withDuratoin:animations:completion)

    =>기본 메서드 + 애니메이션이 완료되면 completion이 동작

#### Spring 

- 구현방법

  - animate(withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:)

    => usingSpringWithDamping, initialSpringVelocity, 여러가지 애니메이션을 제공하는 options을 파라미터로 받는 애니메이션

#### 옵션에 따른 다양한 애니메이션

- static var allowUserInteraction = 터치 이벤트 활성화
- static var repeat = 무한정으로 반복
- static var autoreverse = 애니메이션 반대로 실행
- static var curveEaseInOut = 천천히 진행되다가 중간쯤에 빨라지고 완료되기 전에 다𓂻𓂭 천천히 진행되는 옵션
- static var curveEaseIn = 천천히 진행되면서 조금씩 속도가 높아진다
- static var curveEaseOut = 빠르게 진행되다가 완료됐을 때 천천히 진행



