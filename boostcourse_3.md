## Boostcourse_3

> 기상정보 애플리케이션을 만들자

### 테이블 뷰?

: iOS 애플리케이션에서 많이 활용하는 사용자 인터페이스입니다. 리스트 형태를 지니고 있다.

- 기본적으로 열과 행을 지니며, 수직으로 스크롤
- 섹션(section)을 이용해 행을 시각적으로!
- 헤더(header)와 푸터(footer)에 이미지나 텍스트를 추가하여 추가 정보!!

1. 테이블 뷰 스타일
   - 일반 테이블 뷰
   - 그룹 테이블 뷰
2. 테이블 뷰 생성
   - 스토리보드에서 테이블 뷰를 생성할 때 __동적 프로토타입__ or __정적 셀__ 중 하나를 선택
     - 동적 프로토타입 : 셀 하나를 디자인해 이를 다른 셀의 템플릿으로 사용하는 방식, 같은 레이아수의 셀을 여러 개 이용해 정보를 표시할 경우
     - 정적 셀 : 고유의 레이아웃과 고정된 수의 행을 가지는 테이블 뷰에 사용, 셀의 개수가 변하지 않음

### 테이블 뷰 셀?

: 테이블 뷰를 이루는 개별적인 행으로 <code>UITableViewCell</code> 클래스를 상속받아 생성가능

- 구조

  / 콘텐츠 영역 : 셀의 왼쪽 부분에는 주로 문자열, 이미지 혹은 고유 식별자 등이 입력

  \ 액세서리 뷰 영역 : 셀의 오른쪽 부분에는 액세서리뷰로 상세보기, 재정렬 등 컨트롤 객체가 위치

  +. 편집모드로 전환할 경우 삭제 컨트롤또는 추가 컨트롤 둘 중 하나가 될 수 있다.

- 기본 기능

  ##### <code>UITableViewCell</code> 

  1. <code>textLable</code> : 주제목 레이블
  2. <code>detailTextLabel</code> : 부제목 레이블
  3. <code>imageView</code> : 이미지 표시를 위한 이미지뷰

### DataSource와 Delegate?

- 데이터 소스는 <code>UITableViewDataSource</code> 프로토콜을 채택

  - __UITableViewDataSource__?

    ```swift
    @required
    
    // 특정 위치에 표시할 셀을 요청하는 메서드
     func tableView(UITableView, cellForRowAt: IndexPath) 
     
     // 각 섹션에 표시할 행의 개수를 묻는 메서드
     func tableView(UITableView, numberOfRowsInSection: Int)
     
     @optional
     // 테이블뷰의 총 섹션 개수를 묻는 메서드
     func numberOfSections(in: UITableView)
     
     // 특정 섹션의 헤더 혹은 푸터 타이틀을 묻는 메서드
     func tableView(UITableView, titleForHeaderInSection: Int)
     func tableView(UITableView, titleForFooterInSection: Int)
     
     // 특정 위치의 행을 삭제 또는 추가 요청하는 메서드
     func tableView(UITableView, commit: UITableViewCellEditingStyle, forRowAt: IndexPath)
     
     // 특정 위치의 행이 편집 가능한지 묻는 메서드
     func tableView(UITableView, canEditRowAt: IndexPath)
    
     // 특정 위치의 행을 재정렬 할 수 있는지 묻는 메서드
     func tableView(UITableView, canMoveRowAt: IndexPath)
     
     // 특정 위치의 행을 다른 위치로 옮기는 메서드
     func tableView(UITableView, moveRowAt: IndexPath, to: IndexPath)
    ```

- 델리게이트는 <code>UITableViewDelegate</code> 프로토콜을 채택

  - __UITableViewDelegate__?

    ```swift
    // 특정 위치 행의 높이를 묻는 메서드
     func tableView(UITableView, heightForRowAt: IndexPath)
     // 특정 위치 행의 들여쓰기 수준을 묻는 메서드
     func tableView(UITableView, indentationLevelForRowAt: IndexPath)
    
     // 지정된 행이 선택되었음을 알리는 메서드
     func tableView(UITableView, didSelectRowAt: IndexPath)
    
     // 지정된 행의 선택이 해제되었음을 알리는 메서드
     func tableView(UITableView, didDeselectRowAt: IndexPath)
    
     // 특정 섹션의 헤더뷰 또는 푸터뷰를 요청하는 메서드
     func tableView(UITableView, viewForHeaderInSection: Int)
     func tableView(UITableView, viewForFooterInSection: Int)
    
     // 특정 섹션의 헤더뷰 또는 푸터뷰의 높이를 물어보는 메서드
     func tableView(UITableView, heightForHeaderInSection: Int)
     func tableView(UITableView, heightForFooterInSection: Int)
    
     // 테이블뷰가 편집모드에 들어갔음을 알리는 메서드
     func tableView(UITableView, willBeginEditingRowAt: IndexPath)
    
     // 테이블뷰가 편집모드에서 빠져나왔음을 알리는 메서드
     func tableView(UITableView, didEndEditingRowAt: IndexPath?)
    ```


### 뷰의 재사용

: iOS 기기는 한정된 메모리를 가지고 애플리케이션을 구동한다. 이 때 많은 데이터가 필요하면 재사용할 수 있다. 메모리를 절약하고 성능 또한 향상될 수 있는 방법이다!

- 원리
  1. 테이블뷰 및 컬렉션뷰에서 셀을 표시하기 위해 데이터 소스에 뷰 인스턴스를 요청
  2. 데이터 소스는 요청할 때마다 재사용 큐에 재사용을 하기 위해 대기하고 있는 셀이 있는지 확인 후 있다면 그 셀에 새로운 데이터를 설정하고 없으면 새로운 셀을 생성합니다
  3. 데이터 소스가 반환하면 화면에 표시한다
  4. 사용자가 스크롤 하게 되면 일부 셀들이 화면 밖으로 사라지면서 다시 재사용 큐에 들어갑니다.
  5. 위의 1번부터 4번까지의 과정이 계속 반복
- 큐!

### 세그(Segue)?

: 스토리보드에서 뷰 컨트롤러 사이의 화면전환을 위해 사용하는 객체, 별도의 코드없이 뷰 컨트롤러 사이의 화면전환을 구현가능

- _UIStoryboardSegue_ 클래스

  : 표준 화면전환을 위한 프로퍼티와 메서드를 포함함

  __<code> prepare(for:sender:)</code>  메서드를 사용하여 데이터 전달 가능__

  - 주요 프로퍼티

    ```swift
    var source: UIViewController : //세그에 전환을 요청하는 뷰 컨트롤러입니다.
    var destination: UIViewController : //전환될 뷰 컨트롤러입니다.
    var identifier: String? : //세그 객체의 식별자입니다.
    ```

  - 주요 메서드

    ```swift
    func perform() //뷰 컨트롤러의 전환을 수행합니다.
    ```




### JSON 사용하기

- 인코딩 : 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 다른 형태나 형식으로 처리 혹은 그 처리 방식
- 디코딩 : 인코딩의 반대 작업을 수행하는 것을 뜻함
- Codable : 스위프트의 인스턴스를 다른 데이터 형태로 변환할 수 있는 기능을 `Encodable` 프로토콜로 표현하였고, 그 반대의 역할을 할 수 있는 기능을 `Decodable`로 표현함
- Coding key : JSON 형태의 데이터로 상호 변환하고자 할 떄는 기본적으로 JSON타입의 키와 사용자 지정 프로퍼티가 일치해야함,. 