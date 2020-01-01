<h2>Swift UI</h2>
간단하게 정리해보자

- 출력은 어떻게?

  ```swift
  Text("")
  ```

- 글자 색을 바꾸고 싶을 땐? 

  ```swift
  .foregroundColor
  ```

- 글자를 정리하자

  ```swift
   .font
       .title
       .subheadline
  ```

- View를 합치자

  Vstack(세로 정렬)

  Hstack(가로 정렬)

- 좌우에 공간을 두고 싶다고?

  Spacer()

- 이미지를 삽입하고 싶어?

  1. Image("좌표")

  2. SceneDelegate.swift에 가서 수정

- 이미지에 원형 클리핑 모양을 적용하고 싶어?

  ```swift
  .clipShape(Circle())
  ```

- 이미지에 테두리를 넣고 싶어?

  ```swift
  .overlay(Circle().stroke(Color.gray, lineWidth:4))
  ```

- 그림자를 추가하고 싶어?

  ```
  .shadow(radius:??)
  ```

- 이미지 크기를 조정하고 싶어?

  ```swift
  .frame(width:11, height:30)
  ```

- 