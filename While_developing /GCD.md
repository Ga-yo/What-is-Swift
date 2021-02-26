### GCD - Grand Central Dispatch

멀티 코어 하드웨어에서 동시성 코드 실행을 포괄적으로 지원함



### DispatchQueue

작업 아이템의 실행을 관리한다. 대기열에 제출된 각 아이템은 시스템에 의해서 관리된 스레드풀에 의해 처리된다.

- Serial Dispatch **Queue**

  - 등록된 작업을 한번에 하나씩 차례대로 처리
  - 처리중인 작업이 완료되면 다음 작업을 처리
- Concurrent Dispatch **Queue**

  - 등록된 작업을 하나씩 처리하지 않고 여러 작업들을 동시에 처리


- **Sync** - Serial/Concurrent

  ```swift
  DispathQueue.global().sync { print("1") }
  DispatchQueue.global().sync { print("3") }
  DispatchQueue(label: "Seral").sync { print("5") }
  //1 3 5
  ```

- Async - Serial

  ```swift
  DispatchQueue(label: "SerialQueue").async { print("1") }
  print("2")
  DispatchQueue(label: "SerialQueue").async { print("3") }
  print("4")
  DispatchQueue(label: "SerialQueue").async { print("5") }
  print("6")
  
  //2 1 4 3 5 6
  ```

- Async - Concurrent

  ```swift
  DispatchQueue.global().async { print("1") }
  print("2")
  DispatchQueue.global().async { print("3") }
  print("4")
  DispatchQueue.global().async { print("5") }
  print("6")
  
  //2 1 4 3 6 5
  ```

  여기서 2,4,6의 출력순서만 보장되고 그 이외의 출력순서는 보장되지 않는다.



### API

- Main Queue 생성
  
  ```swift
  DispatchQueue.main.async { }
  ```
  
  - 메인 스레드에서 사용되는 Serial Queue
  
- Global Queue 생성
  
  ```swift
  DispatchQueue.global().sync { }
  ```
  
  - 편의상 사용할 수 있게 만들어 놓은 Concurrent Queue
  - 병렬적으로 동시에 처리하기 때문에 작업 와뇰의 순서는 정할 수 없지만 우선적으로 일 처리 가능

- Custom Dispatch Queue 생성

  ```swift
  //Serial
  DispatchQueue(label: " com.myQueue").async { }
  DispatchQueue(label: " com.myQueue").sync { }
  
  //Concurrent
  DispatchQueue(label: "com.myQueue", qos: .default, attributes: .concurrent, autoreleaseFrequencyL .inherit, target: nil).async { }
  ```

- asyncAfter

  ```swift
  DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { }
  ```

  

- sync
  - 동기 처리 메소드
- async
  - 비동기 처리 메소드