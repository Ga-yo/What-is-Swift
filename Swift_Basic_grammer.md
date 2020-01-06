<h2>Swift Basic grammar</h2>
1. 이름 짓기

   Function, method, variable constant 등은 소문자로

   class, struct enum 등은 대문자로

2. 콘솔로그

   - Print -단순 문자열 출력
   - Dump-인스턴스의 자세한 설명 출력

3. 문자열 보간법

   = \ (수식어) 

   ```swift
   "안녕하세요! 저는 \(age)살입니다."
   ```

4. 상수와 변수

   - 상수 선언 키워드 let

     ```swift
     let 이름: 타입=값 //타입이 명확하다면 생략가능
     //차후에 값 변경할 수 없음
     ```

   - 변수 선언 키워드 var

     ```swift
     var 이름: 타입=값 //타입이 명확하다면 생략가능
     ```

   - 상수 선언 후에 나중에 값 할당받기

     ```swift
     let sum: Int
     let inputA: Int=100
     sum = inputA
     ```

5. 기본 데이터 타입

   - Bool
   - Int, UInt(양의 정수)
   - Float, Double
   - Character, String

6. Any

   : Swift의 모든 타입을 지칭하는 키워드

   ```swift
   var someAny: Any = 100
   someAny = "어떤 타입도 수용 가능하다"
   someAny = 123.12
   ```

7. AnyObject

   :모든 클래스 타입을 지칭하는 프로토콜

   ```swift
   class SomeClass{}
   
   var someAnyObject: AnyObject = SomeClass()
   ```

8. nil

   :없음을 의미하는 키워드

   ```swift
   someAny = nil
   ```

9. 컬렉션 타입

   - Array : 순서가 있는 리스트 컬렉션

   ```swift
   //선언방법
   var integers: Array<Int> = Array<Int>()
   var integers: Array<Int> = [Int]()
   var integers: Array<Int> - []
   var integers: [Int] = Array<Int>()
   var integers: [Int] = [Int]()
   var integers: [Int] = []
   var integers = [Int]()
   ```

   ```swift
   //추가
   var integers = [Int]()
   integers.append(1)
   ```

   ```swift
   //포함되어있는지 확인
   var integers = [Int]()
   integers.contains(100)
   ```

   ```swift
   //교체
   integers[0]=99
   ```

   ```swift
   //멤버 수 확인
   integers.count
   ```

   +불면 Array

   ```swift
   let immutableArray[1,2,3]
   //수정이 불가한 Array이므로 멤버를 추가하거나 삭제할 수 없다.
   ```

   - Dictionary : 키와 값의 쌍으로 이루어진 컬렉션

     ```swift
     //선언방법
     var anyDictionary: Dictionary<String, Any> = [String: Any]()
     var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
     var anyDictionary: Dictionary <String, Any> = [:]
     var anyDictionary: [String: Any] = Dictionary<String, Any>()
     var anyDictionary: [String: Any] = [String: Any]()
     var anyDictionary: [String: Any] = [:]
     var anyDictionary = [String: Any]()
     ```

     ```swift
     //할당
     anyDictionary["someKey"] = "value"
     ```

     ```swift
     //변경
     anyDictionary["someKey"] = "dictionary"
     ```

     ```swift
     //제거
     anyDictionary.removeValue(forKey:"anotherKey")
     anyDictionary["someKey"] = nil
     ```

   - Set : 순서가 없고, 멤버가 유일한 컬렉션

     ```swift
     //선언
     var.integerSet: Set<Int>=Set<Int>()
     ```

     ```swift
     //새로운 멤버 입력
     integerSet.insert(1)
     integerSet.insert(10)
     //동일한 값은 여러번 insert해도 한번만 저장
     ```

     ```swift
     //멤버 포함 여부 확인
     integerSet.contatins(1)
     ```

     ```swift
     //제거
     integerSet.remove(99)
     ```

     ```swift
     //집합 연산에 활용
     let setA: Set<Int>=[1,2,3,4,5]
     let setB: Set<Int>=[3,4,5,6,7]
     
     //합집합
     let union: Set<Int>=setA.union(setB)
     
     //합집합 오름차순
     let sortedUnion: [Int]=union.sorted()
     
     //교집합
     let intersection: Set<Int>=setA.intersection(setB)
     
     //차집합
     let subtracting: Set<Int>=setA.subtracting(setB)
     ```

10. 함수 

    1). 기본 형태

    ```swift
    func 함수 이름(매개변수1 이름: 매개변수1타입)-> 반환타입{
      //반환값이 없으면 void
      //생략가능
    	함수 구현부
    	return 반환값
    }
    
    ex)
    func sum(a: Int, b: Int)->Int{
      return a+b;
    }
    ```

    2). 고급

    ```swift
    greeting(friend: String, me: String = "yagom"){
    	print("Hello\(friend)! I'm\(me)")
    }
    
    greeting(friend: "hana")
    greering(friend: "john", me: "eric")
    ```

11. 조건문

    - if~else 

    ```swift
    if 조건{
     //실행 구문
    } else if 조건{
     //실행 구문
    } else{
     //실행 구문
    }
    ```

    - switch

      ```swift
      switch 비교값{
      	case 패턴:
      	//실행 구문
      	default:
      	//실행 구문
      }
      ```

12. 반복문

    - for-in구문

      ```swift
      for integer in integers{
      	print(integer)
      }
      ```

      (dictionary일 때)

      ```swift
      for (name, age) in people{//튜플타입
      	print("\(name): \(age)")
      }
      ```

    - while

      ```swift
      while integers.count>1{
      	integers.removeLast()
      }
      ```

    - Repeat-while(do-while과 비슷)

      ```swift
      repeat{
      	integers.removeLast()
      }while integers.count>0
      ```

13. 옵셔널

    :값이 있을수도 있고, 없을 수도 있음

     nil이 할당 될 수 있는지 없는지 표현

    - 필요성

      1) nil의 가능성을 코드만으로 표현가능

      2) 문서/주석 작성 시간 절약

      3) 해당 변수에 값이 없을 것 같을 때 사용가능

    - Optional 타입

    ```swift
    let shortFrom: Int? = Int("42")
    let longFrom: Optional<Int> = Int("42")
    ```

      - optional.none == nil

      - Optional.some == wrapped value

        ```swift
        let number: Int? = Optional.some(42)
        let noNumber: Int? = Optional.none
        print(noNumber == nil)//true
        ```

    - 표현 <!>, 표현 <?>

14. 옵셔널 추출: 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것

    - Optional Binding = nil 체크 + 안전한 값 추출

      If-let 

      ```swift
      if let name: String = myName {
          printName(name)
      } else {
          print("myName == nil")
      }
      ```

    - Force Unwrapping = 옵셔널의 값을 강제로 추출

      ```swift
      var myName: String? = "gayo"
      printName(myName!)
      myName=nil//오류
      ```

15. 구조체

    = 값(value) 타입

    ```swift
    struct Sample {
        // 가변 프로퍼티(값 변경 가능)
        var mutableProperty: Int = 100 
        
        // 불변 프로퍼티(값 변경 불가능)
        let immutableProperty: Int = 100 
        
        // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
        static var typeProperty: Int = 100 
        
        // 인스턴스 메서드(인스턴스가 사용하는 메서드)
        func instanceMethod() {
            print("instance method")
        }
        
        // 타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드)
        static func typeMethod() {
            print("type method")
        }
    }
    ```

16. 클래스

    - 참조 타입
    - Swift의 클래스는 다중 상속이 되지 않음

    ```swift
    class 이름{
    	구현부
    }
    ```

    - 타입 메서드

      1. ```swift
         static func typeMethod() {
         	print("type method - static")
         }
         ```

      2. ```swift
         class func classMethod() {
         	print("type method - class")
         }
         ```

17. 열거형

    ```swift
    enum 이름{
    	case 이름1
    	case 이름2
    	case 이름3, 이름4, 이름5
    }
    ```

18. 클래스 vs 구조체/열거형

    - Class
      - 전통적인 OOP 관점에서의 클래스
      - 단일 상속
      - 메서드
      - 프로퍼티
      - 참초타입
    - Struct
      - C언어 등의 구조체보다 다양한 기능
      - 상속 불가
      - 메서드
      - 프로퍼티
      - 값 타입
    - Enum
      - 다른 언어의 열거형과는 많이 다른 존재
      - 상속 불가
      - 메서드
      - 연산 프로퍼티
      - 값 타입

19. 클로저(closer)

    - 클로저가 뭐야?

      -> 실행가능한 코드 블럭

      ​	 함수와 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환 값이 존재 할 수 있다는 점이 동일

      ​	함수는 이름이 있는 클로저

      - 정의

        ```swift
        { (매개변수 목록) -> 반환타입 in
        	실행코드
        }
        ```

        
