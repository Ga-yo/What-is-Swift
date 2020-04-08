### 스토리보드와 Xib

1. 스토리보드

   - 장점

   화면이 작거나 중간 정도인 앱에 적합

   탐색을 위한 요구 사항은 비교적 간단

   코드를 많이 작성하지 않고 앱의 흐름 조정가능

   - 단점

   iOS 5 이전 버전과 호환되지 않아 그 이하 버전은 지원할 수 없다.

   모든 사람들이 동일한 파일을 수정하기 때문에 팀 환경에서 병렬로 작업하기 어려움

2. Xib

   - 장점

   UI를 빠르게 조합할 수 있다.

   최소 화면 수의 소형 응용 프로그램을 위한 직선적인 구현

   요소들을 레이아웃하고 시각적으로 불균형을 파악하는데 유용(+레이아웃을 약간 조정하는 것은 쉽다)

   - 단점

   팀 환경에서 작업할 때 충돌을 병합하기 어려움

   매우 동적 구성인 경우 불가능

   Xib를 디스크에서 읽고 분석,구문 분석해야하기 때문에 코드를 통해 만드는 것보다 속도가 느리다.

   사용자 정의가 없다(그림자, 둥근 모서리)

------

### 정리

#### Storyboard를 사용할 때

- 아주 큰 한 덩어리로 만들지 말자
- 기능/주제/메뉴 등등의 분류대로 여러 개를 구현
- 여러 사람이 작업할 때는 conflict 발생 소지가 아주 높고, merge가 쉽지 않음

##### *이 때 쓰자*

- 뷰 컨트롤러들 사이에서의 이동을 주된 목적으로 하는 다수의 서로 연결된 뷰 컨트롤러의 경우
- 네비게이션 흐름을 쉽게 해줌
- 테이블뷰 컨트롤러 

##### *이 것만은 피하자*

- 복잡한 다이나믹 레이아수을 가진 뷰일 때는 코드 추천
- 뷰가 이미 Xib이거나 코드로 개발되었을 경우는 Storyboard 비추천

#### NIB 사용헐 때

- Storyboard가 NIB의 대체품은 아님
- 더욱 구체적인 UI의 구현이 가능
- 객체지향 관점에서 뷰를 여러 분리된 모듈로 쪼개서 개발, 테스트, 디버그를 더 쉽게 해줌

##### *이 때 쓰자*

- 모달뷰
- 간단한 로그인, 회원가입 뷰
- 설정
- 팝업 윈도우
- 재사용 가능한 뷰
- 재사용 가능한 테이블 뷰 셀

##### *이 때는 쓰지말자*

- 변화무쌍한 레이아웃을 가진 뷰들
- 인터페이스 빌더에서 쉽게 디자인할 수 없는 뷰
- 스토리보드에선 단순하게 처리 가능한 복잡한 화면전환을 가진 뷰 컨트롤러

----

### 예시

기본적인 메시징 앱의 경우

- 기능
  - 친구 목록 = 재사용 가능한 셀
  - 프로필 상세 뷰 = 몇 개의 섹션으로 구성
  - 보내고 받은 메세지 목록 = 채팅방
  - 메세지 작성 룹
  - 사용된 빈도에 따라 크기가 다른 태그 클라우드 = 뷰가 다음의 동작을 하길 바람
  - 친구 목록에서 친구를 클릭하면 프로필 상세를 보여줌
- UI 툴
  - 네 개의 뷰 컨트롤러 - Storyboard
  - 재사용 가능한 프로필 리스트 셀 템플릿을 위한 별도의 NIB 파일
  - NIB 파일 3개 - 프로필 상세 뷰를 위한 상세, 상태, 최근 메세지
  - 태그 클라우드를 위한 커스텀 코드 - 완전히 코드로 구현
