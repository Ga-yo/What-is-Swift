<h2>Storyboard


- 글자색&배경색

  : textColor 프로퍼티, backgroundColor 프로퍼티

  ```swift
    myLabel4.textColor=UIColor.black
          myLabel4.backgroundColor=UIColor.white
  ```

- 문자 정렬

  ```swift
  textalignment = .right(.left .center)
  ```

- 라벨에 글자를 모두 표시할 수 없을 때

- 글자 크기 자동 조정

  - Autoshrink를 minimum Font Scale이나 Minimum Font Size로 설정하면 텍스트를 라벨에 모두 설정 가능

  ```swift
  note1.adjustsFontSizeToFitWidth = true
  ||
  note2.minimumScaleFactor = 0.6
  ```

- 라벨의 영역

  ```swift
  myLabel.frame=CGRect(x: 50, y: 100, width: 200, height: 21)
  ```

- 화면에 표시

  ```swift
  view.addSubview(myLabel)
  ```

  <h3>버튼</h3>
- isEnabled
  
  : 비활성화
  
- 버튼 그리기
  
  1. layer.masksToBounds
    2. layer.cornerRadius
    3. Layer.position

<h3>스테퍼</h3>
- 수치 증감

  ```swift
    @IBOutlet weak var numLabel: UILabel!
    
      @IBAction func changed(_ sender: UIStepper) {
          let num = Int(sender.value)
          numLabel.text=String(num)
      }
  ```

<h3>스위치</h3>
- isHidden

  ```swift
   @IBAction func showhide(_ sender: UISwitch) {
          msgLabel.isHidden = !sender.isOn    }
  ```

  = 스위치가 on이면 라벨 표시

<h3>세그먼티드 컨트롤</h3>
```swift
  @IBOutlet weak var colorChip: UIView!
    @IBAction func pratice(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            colorChip.backgroundColor = UIColor.red
        case 1:
             colorChip.backgroundColor = UIColor.blue
        default :
            colorChip.backgroundColor = UIColor.white
        }
    }
```

<h3>슬라이더</h3>
- 사진 투명성

  ```swift
   @IBOutlet weak var love: UIImageView!
      
      @IBAction func changeslider(_ sender: UISlider) {
          love.alpha=CGFloat(sender.value)
        //알파 값을 슬라이더 값으로 설정
      }
  ```

- contentMode?

  _imageView_ 에 적용 가능한 속성으로 Scale은 가로x세로 비율을 유지하지 않는 것, Aspect는 비율을 유지, Fill은 여백을 남기지 않고 모두 채운다. Aspect Fill은 비율을 유지하면서 여백 없이 채우는 것이다.

- 클리핑?

  슈퍼 뷰보다 서브 뷰가 클 때 그대로 빌드하면 미밀려나서 표시하게 됨. 이때 <code>clipsToBounds</code> 에 true를 주면 서브뷰가 클리핑이 된다. false를 주면 서브뷰가 밀려서 보인다.

- delegate

   __델리게이트 패턴은 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야할 일 중 일부를 다른 객체에 넘기는 것!__

  딜리게이트 쓰는 방법(UITextField)

  1. UIViewController클래스 옆에 Delegate __채택__ 하기
  2. viewdidLoad()함수에 <code>TextField.delegate=self</code> 
  3. 그리고 delegate 함수에 내장된 <code>textFieldShouldReturn</code>함수로 리턴해준다.

  