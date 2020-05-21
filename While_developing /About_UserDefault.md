### Userdefaults??

----

간단히 말하면 __데이터 저장소__ 라고 할 수 있다. 앱의 어느 곳에서나 데이터를 쉽게 읽고 저장할 수 있게 된다. Userdefaults는 사용자 기본 설정과 _같은 단일 데이터 값_에 적합하다.

앱을 실행시켰다가 끄게 되면 모든 데이터는 날아가게되는 것을 방지하기 위해 임시로 저장해놓는 저장소이다.

__!__ 대량의 유사한 데이터를 저장해야할 때에는 sqlite 데이터베이스가 더 적합하다.

<< Userdefault는 [데이터, 키(key)]로 데이터를 저장한다.이때 _key_ 값은 String, 즉 문자열이다.

#### 데이터 저장

```swift
UserDefaults.standard.set(data, forkey: "")
```

#### 값 설정

```swift
data = UserDefaults.standard.--(forket: "")	
```

* -- 은 타입

#### 데이터 가져오기

```swift
UserDefaults.standatd.value(forket: "")
```

#### 데이터 삭제하기

```swift
UserDefaults.standard.removeObject(forket: "")
```

