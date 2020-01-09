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

6. 

