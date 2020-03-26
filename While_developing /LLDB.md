### About LLDB(Low-Level Debugger)

> 야곰닷넷

#### 1. LLDB란?

: Low-Level Debugger를 알기 위해서는 LLVM에 대해 이해해야한다고 한다.

 __LLVM__ 은 Apple에서 진행한 Complier에 필요한 Toolchain 개발 프로젝트이다. 각 컴포넌트들의 재사용성을 중시해서 모듈화가 잘 되어있다는 특징이 있다. 이렇게 모듈화 되어있는 컴포넌트들을 이용해 진행된 주요 서브 프로젝트들로는 LLVM, Core, Clang, libc++, LLDB 등이 있다.

__LLDB__ 는 LLVM의 디버거 컴포넌트를 개발하는 서브 프로젝트이다. 이 프로젝트를 통해서 개발된 Clang Expression Parser, LLVM 등 Low-Level 컨트롤이 가능한 모듈들로 이루어져있고, 기계어에 가까운 영역까지 디버깅 간으하다는 장점이 있다. 현재 xcode의 기본 디버거로 내장되어있다고 한다.

#### 2. 시작하기

: Xcode IDE에서 LLDB 콘솔은 실행중인 프로젝트의 프로세스가 _브레이크 포인트_ 에서 멈추거나, pause 버튼을 통해 일𓂻𓂭정지가 되면 Xcode 화면 하단에 _디버그 콘솔_에 나타난다.

<code> LLDB 콘솔은 터미널에서 lldb -n Finder를 입력하면 실행중인 앱의 프로세스에도 LLDB를 Attach해서 사용할 수 있다.</code>

- 명령어

  <code>Command</code>

  <code>Subcommand</code> 의 경우 Command와 같이 LLDB 내의 Object의 이름이다. 이들은 모두 계층화가 되어있어 Command에 따라 사용 가능한 Subcommand 종류가 다르다.

  <code>Option</code>  Command 뒤 어느 곳에든 위치 가능하며, 하이픈으로 시작한다.

  <code>Argument </code>  공백이 포함되는 경우가 있어 ""로 묶어준다.

### 3. Help & Apropos

- help

  : 해당 문법으로 사용가능한 Subcommand, Option 리스트나 사용법을 보여주는 유용한 명령어이다

- Apropos

  : 원하는 기능의 명령어가 있는지 관련 키워드를 통해 알아볼 수 있는 명령어이다.

### 4. Breakpoint

> 왜인지 접근이 되지 않는다..

### 5. Stepping

1. Stepping Over

: Command 를 이용하면, 현재 Break 걸려있는 지점에서바로 다음 Statement로 Step Over 할 수 있다. 

<code>(lldb) n</code>

2. Stepping In

: 다음 Statement가 Function Call 인 경우 Debugger를 해당 함수 내부에 위치한 시작 지점으로 이동하게 해주는 것

<code>(lldb) s</code>

### 6. Expression

1. po

: 객체에 대한 다양한 정보를 Console에 출력하여 확인할 수 있다. 

2. Variable 

: 메모리에서 변수를 읽어 lldb gudxodml descripition을 출력(단, 사용하고자 하는 변수명 앞에 $ 문자 붙여주기)

