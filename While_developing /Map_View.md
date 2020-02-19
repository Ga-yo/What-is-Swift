### Map_View

1. __Import MapKit__ 추가하기
2. CLLocationManager 이용하기 위해 __CLLocationManegerDelegate프로토콜__ 상속받기
3. CLLocationManager 객체 생성

```swift
let locationManager = CLLocationMananger()
```

4. 위치 설정

```swift
locationManager.desireAccuracy = kCLLocationAccuracyBest //정확도 최고
locationManager.requestWhenInUseAuthorization() //사용자 인증 요청
locationManager.startUpdatingLocation() //위치 업데이트 시작
```

