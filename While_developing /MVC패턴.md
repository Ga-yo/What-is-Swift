### MVC패턴 in iOS

-----

#### MVC 패턴이란?

: Model - View - Controller의 줄임말이다. 

__Model__ 은 데이터에 관한 로직을 담는 부분이다. 값들을 계산하고 저장하는 부분

__View__ 는 사용자에게 보여지는 화면을 가리킨다. 값들이 보여지는 UI

__Controller__ 는 View로 입력된 값을 Model로 전달해주는 역할을 한다. 

이런 패턴은 프로그램이 커져도 유지보수가 상대적으로 쉽다. 왜냐하면 프로그램의 UI를 바꾸고 싶으면 View부분만 바꿔주면 되고 로직을 바꾸고 싶다면 Model부분만 바꾸면 되기 때문이다.

또한 Apple은 iOS를 개발할 때 MVC를 권장합니다. MVC로 개발하기 쉽게 만들어놨기 때문에 권장한다고 볼 수 있다.

![1*jIPmux_88FcVLxtXenbYUA](https://miro.medium.com/max/3589/1*jIPmux_88FcVLxtXenbYUA.png)

이 그림을 보면 Model과 View사이에 중앙선이 있는데 이는 절대 서로에게 접근할 수 없다는 뜻과 같다. 그래서 Controller-View 나 Controller-Model로의 접근은 가능하다. 

그러면 Model-Controller로의 접근은 어떤가? Model은 데이터의 값을 바꾸고 관리만해야한다. 그럼 어떻게 값을 전달할 것인가? 바로 __Notification__ 을 사용한다. Notification이란 Model의 값이 바뀌었을 때 직접 전달하는 게 아니라 Model이 값이 바꼈다고 알려주면 Controller가 이를 듣고 Model에 접근하여 할 수 있다.

다음으로 View-Controller로의 접근은 어떤가? View는 화면을 갱신하는 역할이기 때문에 유저가 View에 값을 입력하거나 터치했을 때 그 변화를 Controller에 직접 전달하면 안된다. 그럴 땐 __Delegate__ or __Data Source__ 를 사용하면 된다. 

-----

#### MVC 패턴의 장단점

__장점__

1. 생산성이 좋다.

__단점__

1. iOS의 MVC는 분리가 완전하지 않아서 실제로 View의 생명주기에 관한 코드나 네트워크 통신에 관한 코드도 Controller에 위치해있어서 Controller의 크기가 커치는 경향이 있다.