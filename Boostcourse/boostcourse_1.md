<h2>부스트코스 - MusicPlayer
</h2>

1. @IBOutlet으로 연결

2. 컨트롤 이벤트와 액션의 관계

   - UIkit : UIButton, UISwitch, UIStepper 등 UIControl을 상속받은 다양한 컨트롤 클래스가 있음. 이 객체에서 발생한 다양한 이벤트를 특정 액션 메서드에 연결할 수 있음.

     ->객체에서 특정 이벤트가 발생하면, 미리 지정해 둔 타겟의 액션을 호출하게 됨.

   - 컨트롤 이벤트

     - touchDown

       : 컨트롤을 터치했을 때 발생, UIControl.Event.touchDown

     - touchDownRepeat

       : 컨트로를 연속 터치 할 때 발생,  UIControl.Event.touchDownRepeat

     - touchDragInside

       : 컨트롤 범위 내에서 터치한 영역을 드래그 할 때, UIControl.Event.touchDragInside

     - touchDragOutside

       :터치 영역이 컨트롤의 바깥쪽에서 드래그 할 때, UIControl.Event.touchDragOutside

     - touchDragEnter

       :터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔다가 다시 들어왔을 때, UIControl.Event.touchDragEnter

     - touchDragExit

       :터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔을 때, UIControl.Event.touchDragExit

     - touchUpOutside

       :컨트롤 영역 안쪽에서 터치 후 컨트롤 밖에서 뗐을때, UIControl.Event.touchUpOutside

     - touchCancel

       :터치를 취소하는 이벤트,  UIControl.Event.touchCancel

     - valueChanged

       :터치를 드래그 및 다른 방법으로 조작하여 값이 변경되었을 때, UIControl.Event.valueChanged

     - primaryActionTriggered

       :버튼이 눌릴 때, UIControl.Event.primaryActionTriggered

     - editingDidBegin

       :UITextField에서 편집이 시작될 때, UIControl.Event.editingDidBegin

     - editingChanged

       :UITextField에서 값이 바뀔 때마다, UIControl.Event.editingChanged

     - editingDidEntOnExti

       :UITextField의 편집상태에서 키보드의 return 키를 터치했을 때, UIControl.Event.editingDidEndOnExit

     - allTouchEvents

       :모든 터치 이벤트

       UIControl.Event.allTouchEvents

     - allEditingEvents

       :UITextField에서 편집작업의 이벤트

       UIControl.Event.allEditingEvents

     - applicationREserved

       :프로그래머가 임의로 지정할 수 있는 이벤트 값의 범위

       UIControl.Event.applicationReserved

     - systemReserved

       :프레임워크 내에서 사용되는 예약된 이벤트 값의 번위

       UIControl.Events.systemReserved

     - allEvents

       :시스템 이벤트를 포함한 모든 이벤트

       UIControl.Event.allEvents

3. 버튼

   - 생성

     1). 생성하고 버튼의 유형을 선택

     2). 버튼에 문자를 입력하거나 이미지를 설저한 뒤 크기를 조절

     3). 특정 이벤트가 발생할 때 작동할 하나 이상의 메서드

   - 버튼과 메서드 연결

     1). addTarget(_:action:for:) 메서드 사용

     2). 인터페이스 빌더에서 연결 (@IBAction)

     ```swift
     func doSomething()
     func doSomething(sender: UIButton)
     func doSomething(sender: UIButton, forEvent event: UIEvent)
     ```

   - 상태

     - Default, highlighted, focused, selected, disabled
     - 기본 상태는 default

   - 프로퍼티

     - Enum UIButtonType
     - Var titleLabel : UILabel?
     - Var imageView : UIImageView?
     - var tintColor : UIColor!

   - 주요 메서드

     ```swift
     // 특정 상태의 버튼의 문자열 설정
     func setTitle(String?, for: UIControlState)
     // 특정 상태의 버튼의 문자열 반환
     func title(for: UIControlState) -> String?
     // 특정 상태의 버튼 이미지 설정
     func setImage(UIImage?, for: UIControlState)
     // 특정 상태의 버튼 이미지 반환
     func image(for: UIControlState) -> UIImage?
     // 특정 상태의 백그라운드 이미지 설정
     func setBackgroundImage(UIImage?, for: UIControlState)
     // 특정 상태의 백그라운드 이미지 반환
     func backgroundImage(for: UIControlState) -> UIImage?
     // 특정 상태의 문자열 색상 설정
     func setTitleColor(UIColor?, for: UIControlState)
     // 특정 상태의 attributed 문자열 설정
     func setAttributedTitle(NSAttributedString?, for: UIControlState)
     ```

4. 레이블

   - 생성

     1). 레이블 생성

     2). 표시할 문자열 제공

     3). 레이블의 모양 및 특성을 설정

   - 프로퍼티

     - var text: String? -> 레이블이 표시할 문자열
     - var attributedText: NSAttributedString? -> 특정 부분의 속성 변경
     - var textColor: UIColor!
     - var font: UIFont!
     - var textAlignment: NSTextAlignment ->문자열 가로정렬 방식
     - var numberOfLines: Int ->문자를 나타내는 최대 라인 수
     - Var lineBreakMode: NSLineBreakMode -> 레이블의 경계선을 벗어나는 문자열에 대응하는 방식
       - Character wrap`: 여러 줄 레이블에 주로 적용되며, 글자 단위로 줄 바꿈을 결정합니다.
       - `Word wrap`: 여러 줄 레이블에 주로 적용되며, 단어 단위로 줄 바꿈을 결정합니다.
       - `Truncate head`: 한 줄 레이블에 주로 적용되며, 앞쪽 텍스트를 자르고 ...으로 표시합니다.
       - `Truncate middle`: 한 줄 레이블에 주로 적용되며, 중간 텍스트를 자르고 ...으로 표시합니다.
       - `Truncate tail`: 한 줄 레이블에 주로 적용되며, 끝쪽 텍스트를 자르고 ...으로 표시합니다. **기본 설정 값**입니다.

5. 슬라이더

   - 생성

     1). 슬라이더 생성, 값의 범위를 지정

     2). 적절한 색상과 이미지를 이용해 슬라이더의 모양을 구성하세요.

     3). 하나 이상의 메서드를 슬라이더와 연결

   - 슬라이더와 메서드 연결

     1). addTarget(_:action: for:) 메서드 사용

     2). 인터페이스 빌더에서 연결(@IBAction)

     ```
     func doSomething()
     func doSomething(sender: UISlider)
     func doSomething(sender: UISlider, forEvent event: UIEvent)
     ```

   - 프로퍼티

     - Var minimumValue: Float
     - Var value: Float
     - Var isContinuous: Bool
     - var minimumValueImage: UIImage?
     - var thumbTintColor: UIColor
     - var minimumTrackTintColor: UIColor?

   - 메서드

     ```swift
     //  슬라이더의 현재 값 설정
     func setValue(Float, animated: Bool)
     
     //  특정 상태의 minimumTrackImage 반환
     func minimumTrackImage(for: UIControlState) -> UIImage?
     
     // 특정 상태의 minimumTrackImage 설정
     func setMinimumTrackImage(UIImage?, for: UIControlState)
     
     // 특정 상태의 maximumTrackImage 반환
     func maximumTrackImage(for: UIControlState) -> UIImage?
     
     // 특정 상태의 minimumTrackImage 설정
     func setMaximumTrackImage(UIImage?, for: UIControlState)
     
     //  특정 상태의 thumbImage 반환
     func thumbImage(for: UIControlState) -> UIImage?
     
     //특정 상태의 thumbImage 설정
     func setThumbImage(UIImage?, for: UIControlState)
     ```

   <h4>AVFoundation</h4>

   - Apple 플랫폼에서 사운드 및 영상 미디어의 처리, 제어, 가져오기 및 내보내기를 하는 프레임워크입니다.

   <h4>AVAudioPlayer Class</h4>

   - 주요 기능
     - 사운드 재생
     - 길이의 제한 없이 사운드 재생
     - 여러 개 동시 재생
     - 속도 제어
     - 파일의 특정 지점 찾기
     - 현재 재생 정보 데이터 업기
     - 사운드 반복재생 기능
   - 주요 프로퍼티
     - Var isPlaying: Bool
     - var volume: Float
     - var rate: Float
     - var numberOfLoops: Int
     - var duration: TimeInterval
     - Var currentTime: TimeInterval
     - Protocol AVAudioPlayerDelegate

<h4>Cocoa Touch</h4>

- 코코아 터치 프레임워크

<h4>UIKit</h4>

- 앱 개발시 사용자에게 보여질 화면을 구성하고 사용자 액션에 대응에 관련된 다양한 요소를 포함한다.

<h4>Foundation</h4>

- 코코아 터치 프레임워크에 포함된 프레임워크이다.
- 데이터 타입, 날짜 및 시간 계산, 필터 및 정렬, 네트워킹 등 기본 기능 제공

<h4>오토 레이아웃?</h4>

- 속성?

  : 모든 요소들은 <code>NSLayoutAttributes</code> enum타입에 정의되어 있다. 그리고 <code>translatesAutoresizingMaskIntoConstraints</code> 값을 _false_로 바꿔야 한다.

1. 앵커를 사용하기

   - <code>NSLayoutAnchor</code> 는 제한요소를 만들기 위한 유틸리티 클래스로 다양한 제약 요소들을 생성할 수 있다.

     ```swift
     let margins = view.layoutMarginsGuide
     myView.leadingAnchor.constraint(equalTo:margins.leadingAnchor).active=true
     myView.trailingAnchor.constraint(equalTo:margins.trainlingAnchor).active=true
     //좌우를 기본 레이아웃 마진을 사용하여 부모 뷰에 딱 고정시킴
     myView.heightAnchor.constraint(equalTo:myView.widthAnchor, multiplier: 2.0)
     //높이를 가로의 2배로 사용
     ```

     

- 하나의 사이즈였던 기종들이 점차 시기가 변화하며 다양한 사이즈와 화면 비율로 출시되었기 때문에 이에 구애 받지 않고 시각적으로 동일한 화면을 구현해야할 때 권장되는 방법

  - 외부 변경

    -> 슈퍼뷰의 크기나 모양이 변경될 때

  - 내부변경

    -> 애플리케이션 변경에 의해 콘텐츠가 보여질 때, 국제화 지원, 동적 타입 지원 등...

    

    ![스크린샷 2020-01-14 오후 3.41.04](/Users/igayeong/Library/Application Support/typora-user-images/스크린샷 2020-01-14 오후 3.41.04.png)

|    정의    |             뜻             |
| :--------: | :------------------------: |
|   width    |       사각형의 너비        |
|   height   |       사각형의 높이        |
|   bottom   |       사각형의 하단        |
|  baseline  |       텍스트의 하단        |
| horizontal |            수평            |
|  vertical  |            수직            |
|  leading   | 텍스트를 읽을 때 시작 방향 |
|  trailing  |  텍스트를 읽을 때 끝 방향  |
|  centerX   |         수평 중심          |
|  centerY   |         수직 중심          |
|            |                            |

+ 안전 영역(safe area)

  - 상태바, 내비게이션 바, 툴 바, 탭 바를 가리는 것을 방지하는 영역

    +. margins

+ 제약(constraint)

  - 뷰와 뷰 사이의 관계

  - ![스크린샷 2020-01-14 오후 3.56.56](/Users/igayeong/Library/Application Support/typora-user-images/스크린샷 2020-01-14 오후 3.56.56.png)

    | 정의       | 뜻                                      |
    | ---------- | --------------------------------------- |
    | item1      | 뷰 또는 레이아웃                        |
    | Attribute  | 첫번째 아이템에 대한 속성               |
    | Multiplier | 속성 2에 곱해지는 값                    |
    | Item2      | 두번째 아이템                           |
    | Attribute  | 두번째 아이템에 대한 속성               |
    | Constant   | 두번째 아이템의 속성에 더해지는 상수 값 |
    |            |                                         |

  - 고유 콘텐츠 크기

  - 제약 우선도

  - 레이아웃 마진

  - 앵커

  - Layout Anchor - 앵커와 관련된 프로퍼티

  ```swift
  var constraints: [NSLayoutConstraint]
  // 뷰에 부여한 제약사항들은 담은 배열
  
  var bottomAnchor: NSLayoutYAxisAnchor { get }
  // 뷰 프레임의 하단부 레이아웃 앵커
  
  var centerXAnchor: NSLayoutXAxisAnchor { get }
  // 뷰 프레임의 수평 중심부 레이아웃 앵커
  
  var centerYAnchor: NSLayoutYAxisAnchor { get }
  // 뷰 프레임의 수직 중심부 레이아웃 앵커
  
  var heightAnchor: NSLayoutDimension { get }
  // 뷰 프레임의 높이를 가리키는 레이아웃 앵커
  
  var leadingAnchor: NSLayoutXAxisAnchor { get }
  // 뷰 프레임의 리딩을 가리키는 레이아웃 앵커
  
  var topAnchor: NSLayoutYAxisAnchor { get }
  // 뷰 프레임의 상단부 레이아웃 앵커
  
  var trailingAnchor: NSLayoutXAxisAnchor { get }
  // 뷰 프레임의 트레일링을 가리키는 레이아웃 앵커
  
  var widthAnchor: NSLayoutDimension { get }
  // 뷰 프레임의 넓이를 가리키는 레이아웃 앵커
  ```

<h4>
  디자인 패턴
</h4>

- 종류

  |       이름       | 목적 | 범위         | 설명                                                         |
  | :--------------: | ---- | ------------ | ------------------------------------------------------------ |
  |   싱글턴 패턴    | 생성 | 객체         | 객체의 생성에 관련된 패턴으로 특정 클래스의 인스턴스가 오직 하나임을 보장하고 이 인스턴스에 접근할 방법을 제공한다. |
  |   퍼사드 패턴    | 구조 | 객체         | 하위 객체들을 사용할 수 있도록 하는 역할을 한다. 서브 시스템을 구조화하고 접근을 하나의 퍼사드 객체로 제공한다. |
  |   옵저버 패턴    | 행위 | 객체         | 상태 변화를 관찰하는 관찰자들, 상태 변화가 있을 때마다 메서드 등을 통해 옵저버에게 통지하도록 함 |
  | 스트래티지 패턴. | 행위 | 객체         | 알고리즘을 담당하는 각각의 클래스를 만들어 책임을 분산하기 위한 목적으로 만든 행위 패턴 |
  |   팩토리 패턴    | 생성 | 클래스       | 어떤 클래스의 인스턴스를 생성할지에 대한 결정은 하위클래스에서 이루어지도록 책임을 떠넘긴다 |
  |   어댑터 패턴    | 구조 | 클래스, 객체 | 클래스의 인터페이스를 사용자가 기대하는 다른 인터페이스로 변환하는 패턴으로, 호환성이 없는 인터페이스 때문에 함께 동작할 수 없는 클래스들이 함께 동작하도록 해준다. |

  