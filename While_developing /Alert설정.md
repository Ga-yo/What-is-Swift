### Alert

> Alert의 사용법

1. alert의 제목과 메세지 만들기

   ```swift
   let alert = UIAlertController(title: "String", message: "subtitle", preferredSrtle" UIAlertController.Style.alert)
   ```

   <code>preferredStyle</code> 

   1. actionSheet = 밑에서 생겨나는 알림창
   2. Alert = 중간에 생기는 알림창

2. alert의 액션 버튼 만들기

   ```swift
   let alertaction = UIAlertAction(title: "String", style: .??) { (action) in
   }
   ```

   <code>style</code>

   1. Cancel

   2. default

      : Alert에서는 _default_ 와 글씨 굵기 차이이지만 actionSheet에서는 UI가 다르다

   3. Destructive

      : 글씨 색이 RED

3. Alert틀에 액션버튼 연결해주기

   ```swift
   alert.addAction(defaultAction)
   ```

4. Alert view 화면에 뜨게 만들기

   ```swift
   present(alert. animated: bool, completion: nil)
   ```

   