### Defer란?

: 현재 코드 블록을 나가기 전에 실행해야되는 코드를 작성하여 코드가 블록을 어떻게 빠져 나가든 꼭 마무리해야되는 작업을 할 수 있게 도와준다

```swift
func test() {
	defer {
		print("test function defer")
	}
	print("Hello World")
}
//Hello World
//test function defer
```

출력되는 순서가 "Hello World"가 우선인 것을 보면 함수가 종료되면서 defer가 print 되는 것을 확인할 수 있다.



### Defer의 실행 순서

**역순으로 실행**

```swift
func learnDefer() {
  defer {
    print("test 1")
  }
  
  defer {
    print("test 2")
  }
  
  defer {
    print("test 3")
  }
  
  print("test 4")
}

//test 4 
//test 3
//test 2
//test 1
```

실행 결과를 보면 defer는 선언된 순서의 반대로 실행되고 있음을 확인할 수 있다.



### 중첩 코드 블록에서의 defer 실행 순서

이건 좀 생각이 필요한 것 같다. 천천히 코드를 살펴보자

```swift
func learnDefer() {
	defer {
    print("test1")
  }
  
  do {
    defer {
      print("test2")
    }
    print("test3")
  }
  
  for i in 0..<2 {
        defer {
            print("test 4")
        }

        if i % 2 == 0 {
            defer {
                print("test 5")
        }
          print("test 6")
       }
   }
  print("test7")
}

//test2
//test3
//test6
//test5
//test4
//test4
//test7
//test1
```

- learnDefer()는 처음 선언된 defer로 맨 마지막에 출력
- do문에서 test3이 첫번째, do문을 빠져나가기전에 test2가 호출
- for 문에서 if이 먼저 실행되기 때문에 test6이 세번째, if 문을 빠져나가면 test5가 호출 그리고 짝수일 때 test4가 두번 호출된다 
- 맨마지막 test7이 실행..



### Defer가 호출되지 않는 경우

defer는 코드 블록에 빠져 나가기 직전에 호출된다고 알고있지만 무조건 defer를 선언한다고 해서 100프로 호출을 보장하지 않는다.

1. throw를 이용해서 오류를 던질 경우

   ```swift
   func test(isError: Bool) throws -> Void{
       defer {
           print("test 1")
       }
   
       if isError {
           enum TestError: Error {
               case error
           }
   
           throw TestError.error
       }
   
       defer {
           print("test 2")
       }
   
       print("test 3")
   }
   
   ```

   이렇게해서 중간에 throw가 발생해 함수가 종료되면 defer는 함수가 정상적으로 종료되지 못하기 때문에 도달하지 못한다. 그래서 호출되지 않는다

2. guard 문을 사용하여 중간에 함수를 종료하는 경우

   ```swift
   func test(string: String?) {
   	defer {
       print("test 1")
     }
     
     guard let str = string else {return}
     
     defer {
       print("test 2")
     }
   }
   ```

   guard문을 이용할 때도 마찬가지고 throw로 오류를 던질 경우에 defer에 도달하지 못한다. 그래서 defer는 결국 호출되지 않는다.

3. 리턴값이 Never인 경우

   ```swift
   func test() -> Never {
      defer {
           print("test 1")
       }
   
       defer {
           print("test 2")
       }
   
       defer {
           print("test 3")
       }
   
       abort()
   }
   ```

   에러가 발생하면서 함수를 반환하지 않고 실행을 종료하기 때문에 defer가 호출되지 않는다.

> Never는 "**정상적으로 리턴하지 않는 함수(function)의 리턴 타입**"