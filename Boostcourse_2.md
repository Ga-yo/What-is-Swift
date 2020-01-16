## Boostcourse_2

> 회원가입 화면 구현하기

### H.I.G(Human Interface Guidelines)

: 어플리케이션을 개발할 때 필요한 디자인과 동작을 포함한 여러 규칙을 통하여 사용자 인터페이스를 어떻게 구성하는 방법에 대한 지침을 제시하는 문서

- Why?
  1. 어플리케이션을 설계할 때 사용자와 상호작용에 관해 생각하고 설계 가능
  2. 사용자의 입장에서 바라보고 설계 가능
  3. 일관성 유지
  4. 협업에 있어 기준점을 제시하여 협업의 효율을 높일 수 있음
  5. 사용자에게 익숙한 환경으로 사용의 진입장벽을 낮출 수 있음
  6. 유연한 사용자 경험 설계 가능
- 구성
  1. _Overview_ : iOS 플랫폼 테마의 특징과 인터페이스 요소에 관한 개요
  2. _App Architecture_ : 애플리케이션 아키텍처 설계 시 고려할 사항
  3. _User Interaction_ : 애플리케이션이 사용자와 상호작용하느 동작 설계 시 고려할 사항
  4. _System Capabilities_ : 시스템이 지원하는 기능에 대해 설계 시 고려할 사항
  5. _Visual Design_ : 애플리케이션의 시각적인 요소 설계 시 고려할 사항
  6. _Icons and Images_ : iOS에서의 이미지, 아이콘, 시작화면에 관한 내용 설명
  7. _Bars_ : iOS에서 사용하는 바의 각 역할과 용도에 관한 설명과 구현할 때 고려할 사항
  8. _Veiw_ : 뷰의 종류와 역할에 관해 설명하고 설계 시 고려할 사항
  9. _Controls_ : 여러가지 컨트롤 요소들에 관한 소개와 설계 시 고려할 사항
  10. _Extensisions_ : 여러가지 확장기능을 사용하는 애플리케이션 설계 시 고려할 사항
  11. _Technologies_ : 여러 기술을 구현할 수 있응 Kit에 관하여 설명하고 설계 지침
  12. _Resources_ : OS를 포함한 애플의 플랫폼들에 대한 자원 제공에 관한 내용

### 내비게이션 인터페이스

: 계층적 구조로 화면전화을 위해 사용되는 드릴 다운 인터페이스이다. 각 선택할 수 있는 항목에 대한 세부항목이 존재하는 인터페이스이다.

__내비게이션 컨트롤러를 통해 구현!__

+ 내비게이션 컨트롤러 = 컨테이션 뷰 컨트롤러로

+ _내비게이션 스택_ 사용 -> 다른 뷰 컨트롤러 관리

+ 두 개의 뷰를 화면에 표시함 

  / 스택 뷰에 포함된 최상위 컨텐트 뷰 컨트롤러의 콘텐츠를 나타내는 뷰

  \ 내비게이션 컨트롤러가 직접 관리하는 뷰

### 내비게이션 스택

: 내비게이션 스택의 가장 상위에 있는 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 보이게 됨

+.UINavigationController 클래스를 사용하여 내비게이션 스택의 뷰 컨트롤러를 추가/삭제 가능

![스크린샷 2020-01-15 오후 8.59.22](/Users/igayeong/Library/Application Support/typora-user-images/스크린샷 2020-01-15 오후 8.59.22.png)

- 푸시(Push)
  1. 루트 뷰 컨트롤러 = 초기 상태
  2. '뷰 컨트롤러 1로 이동' 버튼을 이용해 스택에 뷰 컨트롤러 1을 푸시(push)함. 그러면 뷰 컨트롤러 1이 최상위 뷰 컨트롤러가 됨
  3. '뷰 컨트롤러 2로 이동' 버튼을 이용해 내비게이션 스택에 뷰 컨트롤러 2도 푸시(push) 그렇게 스택에 추가됨. 여기선 뷰 컨트롤러 2가 최상위 뷰 컨트롤러가 됨. __이 상황에서 새로운 뷰 컨트롤러가 추가될 때도 아래에 있는 뷰 컨트롤러 들이 삭제되지 않고 유지된다는 점을 알아야함!__

- 팝(Pop)

  _UIViewController의 인스턴스는 다른 곳에서 참조 되지 않다면 메모리에서 해제되고, 삭제_

  1. 뷰 컨트롤러 1을 누르고 뷰 컨트롤러 2를 팝(pop)함. 그러면 뷰 컨트롤러 1이 다시 최상위 뷰 컨트롤러가 됨
  2. 루트 뷰 컨트롤러를 누르고 뷰 컨트롤러 1을 팝(pop)함. 뷰 컨트롤러 1이 메모리에서 해체되고 삭제됨. 루트 뷰 컨트롤러가 최상위 뷰 컨트롤러가 됨 __루트 뷰 컨트롤러를 내비게이션 스택에서 팝되지 않음__  

### UINavigationController class

- 생성

  ```swift
  init(rootViewController: UIViewController)
  ```

- 내비게이션 스택의 뷰 컨트롤러에 대한 접근

  ```swift
  var topViewController: UIVeiwController?
  //최상위 뷰 컨트롤러 접근
  var visibleViewController: UIViewController?
  //인터페이스에서 보이는 뷰와 관련된 뷰 컨트롤러에 접근
  var viewController: [UIViewController]
  //특정 뷰에 접근 (루트 뷰 컨트롤러는 인덱스가 0)
  ```

- 내비게이션 스택의 푸시와 팝에 관한 메서드

  ```swift
  func pushViewController(UIViewController, animated: Bool)
  //푸시된 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 표시
  func popViewController(animated: Bool) -> UIViewController?
  //최상위 뷰 컨트롤러 아래에 있던 뷰 컨트롤러의 콘텐츠가 화면에 표시
  func popToRootViewController(animated: Bool) -> [UIViewController]?
  //삭제된 모든 뷰 컨트롤러의 배열이 반환
  func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]?
  //특정 뷰 컨트롤러가 최상위 뷰 컨트롤러가 되기 전까지 상위에 있는 뷰 컨트롤러들을 팝
  ```

  

### 내비게이션 인터페이스 구성하는 법

#### 1. 스토리보드

- [Editor] - [Embed in] - [Navigation Controller]
- 선택한 뷰 컨트롤러가 내비게이션 컨트롤러의 루트 뷰 컨트롤러가 되면서 내비게이션 컨트롤러 생성

#### 2. 코드 작성

1. applicationDidFinishLaunching의 메서드에 구현 가능
2. init(rootViewController: UIViewController) 메서드를 통해 초기화하고 생성
3. 내비게이션 컨트롤러 윈도우의 루트 뷰 컨트롤러로 설정

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey:Any]?)->Bool{
          // 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성합니다.
        let rootViewController = UIViewController()
        // 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성합니다.
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // 윈도우의 루트 뷰 컨트롤러로 내비게이션 컨트롤러를 설정합니다.
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
}
```

### 내비게이션바의 구성

: 내비게이션바 타이틀, 내비게이션 아이템

- 내비게이션바는 내비게이션 아이템을 가질 수 있음.
- 내비게이션바 자체는 내비게이션 컨트롤러가 관리하는 하나의 공통 객체
- 내비게이션바의 타이틀을 통해 현재의 위치를 알 수 있음

### 모달

: 사용자의 이목을 끌기 위해 사용하는 화면 전환 기법이다.

- Presenting a View Controller

  / 컨테이너 뷰 컨트롤러에 임베드

  \ 프레젠테이션을 통해

- 프레젠테이션 및 전환 프로세스

  :UIKit에 내장된 프레젠테이션 기능은 내장 혹은 커스텀 애니메이션을 사용하여 새로운 뷰 컨트롤러를 표시할 수 있도록 한다.

  1. 전체화면 프레젠테이션 스타일_(UIModalPresentationFullScreen)_

     전체 화면을 덮으며, 기본 콘텐츠와 상호작용을 방지함. 

  2. 팝오버 스타일 _(UIModalPresentationPopover)_

     뷰 컨트롤러를 팝오버뷰로 나타낸다. 주로 선택한 객체와 관련된 항목 목록을 표시하는데 유용

     __iPad에서만 지원 __

  3. 현재 컨텍스트 스타일_(UIModalPresentationCurrentContext)_

     뷰 컨트롤러의 콘텐츠 영역에 콘텐츠를 올리는 형태

  4. 커스텀 프레젠테이션 스타일_(UIModalPresentationCustom)_

     커스텀 스타일을 사용하여 뷰 컨트롤러 표시 가능

  5. 전환 스타일_(UIModalTransitionStyleCoverVertical)_

     화면 상에서 어떻게 애니메이션이 나타내는지를 알 수 있음. 

- 뷰 컨트롤러 나타내기 vs 보여주기

  /<code> howViewController:sender: </code>와 <code>showDetailViewController:sender:</code>

    메서드는 뷰 컨트롤러를 표시하는데 가장 적응성이 우수하고 유연한 방법을 제공

  \ <code>presentViewController:animated:completion: </code>메서드는 뷰 컨트롤러를 항상 모달 방식으로 표시함.

  - 나타내기 (__Presenting a View Controller__)

    세그를 사용

    > #### 세그란?(segue)
    >
    > 앱의 스토리보드 파일에 두 개의 뷰 컨트롤러 사이의 전환을 정의함. segue의 시작점은 segue를 시작하는 버튼, 테이블 행 또는 제스처 인식기이다. segue의 끝점은 표시하려는 뷰 컨트롤러이다.

    <code>showViewController: sender: </code>또는 <code>showDetailViewController:sender: </code>메서드 사용

  - 보여주기(__Showing View Controllers__)

    <code>show(_ : sender:)</code>와 <code>showDetailViewController(_ :sender:)</code> 메서드를 사용할 때, 새로운 뷰 컨트롤러를 화면에 띄우는 과정

    	1. 뷰 컨트롤러 객체 만들기
     	2. 프레젠테이션 스타일로 설정
     	3. 현재 뷰의  `showViewController:sender:` 와 `showDetailViewController:sender:`  메서드 호출

  - 모달로 표시하기

    1. 뷰 컨트롤러 객체 만들기
    2. 새로운 뷰 컨트롤러의 <code>modalPresentationStyle</code> 프로퍼티를 선호하는 스타일로 설정
    3. 현재 뷰 컨트롤러의 <code>presentViewController: animated: completion:</code>메서드 호출

  - 팝오버에 뷰 컨트롤러 나타내기

  - 나타난 뷰 컨트롤러 닫기

    1. 뷰 컨트롤러의 <code>dismiss(animated:completion:)</code> 메서드 호출

### 뷰의 상태변화 감지 메서드

: 뷰가 나타나거나 사라지는 등 뷰가 화면에 보이는 상태가 변화할 때 호출되는 메서드. 

- 상태변화 메서드

1. <code>func viewDidLoad()</code>
   - 뷰 계층이 메모리에 로드된 직후 호출
   - 초기화 작업하기 good
2. <code>func viewWillAppearo(_ animate: Bool)</code>
   - 뷰가 뷰 계층에 추가되고 화면이 표시되기 직전에 호출
   - 추가적인 초기화 작업하기 good
3. <code>func viewDidAppear(_ animated: Bool)</code>
   - 뷰가 뷰 계층에 추가되어 화면이 표시되면 호출
   - 추가적인 작업하기 good
4. <code>func viewWillDisappear(_ animated: Bool)</code>
   - 뷰가 뷰 계층에서 사라지기 직전에 호출
   - 생성된 뒤 발생한 변화를 이전상태로 되돌리기 좋음
5. <code>func viewDidDisappear(_ animated: Bool)</code>
   - 뷰가 뷰 계층에서 사라진 후 호출되는 메서드
   - 뷰를 숨기는 것과 관련된 추가적인 작업하기 good

- 레이아웃 변화 메서드

1. <code>func viewWillLayoutSubviews()</code>
   - 뷰가 서브뷰의 레이아웃을 변경하기 직전에 호출
   - 서브뷰의 레이아웃을 변경하기 전에 수행하기 good
2. <code>func viewDidLayoutSubviews()</code>
   - 서브뷰의 레이아웃이 변경된 후 호출
   - 서브뷰의 레이아웃을 변경 한 후 추가적인 작업하기 good

### 중요

__뷰 컨트롤러에서 위 메서드를 사용하기 위해 아래와 같이 override 키워드를 명시하고 super를 호출하기!!__