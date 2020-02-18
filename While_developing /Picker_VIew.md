### PickerView

> pickerview의 주요 요소

-------

##### 데이터 제공

```swift
var dataSource: UIPickerViewDataSource?
```

-------

##### 동작 사용자 정의

```swift
var delegate: UIPickerViewDelegate?
```

------

##### Picker View의 치수

1. ```swift
   var numberOfComponents: Int
   ```

   : 구성요소 수

2. ```swift
   func numberOfRow(inComponent: Int) - > Int
   ```

   : 구성요소의 행 수

3. ```swift
   func rowSize(forComponent: Int) -> CGSize
   ```

   : 컴포넌트의 행 크기

-----

##### Picker View 다시로드

1. ```swift
   var reloadAllComponents()
   ```

   : 모든 구성요소를 리로드

2. ```swift
   var reloadComponent(Int)
   ```

   : 특정 구성 요소 다시 리로드

-----

##### Picker View 행 선택

1. ```swift
   func selectRow(Int, inComponent: Int, animated: Bool)
   ```

   : 지정된 구성 요소에서 행 선택

2. ```swift
   func selectedRow(inComponent: Int) -> Int
   ```

   : 주어진 컴포넌트에서 선택한 행의 인덱스 반환

------

