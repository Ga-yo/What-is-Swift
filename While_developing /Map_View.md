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

-----

<code>CLLocationCoordinate2DMake</code> : 위도 및 경도 값을 좌표 데이터 구조 형식으로 포맷합니다.

<code>MKPointAnnotation</code> : 지도에서 지정된 점에 연결된 구체적인 객체

<code>MKCoordinateRegion</code> : 특정 위도 및 경도를 중심으로 하는 직사각형 지역

<code>MKCoordinateSpan</code> :지도 영역의 너비와 높이

<code>CLLocationDegrees</code> :도 단위로 지정된 위도 또는 경도 값

 