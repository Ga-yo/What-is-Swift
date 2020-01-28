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

    