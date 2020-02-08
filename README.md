# swift-pokergameapp
STEP15 포커게임 앱 저장소



## step 1 : 게임판 만들기

<img width="538" alt="image" src="https://user-images.githubusercontent.com/37682858/74084348-89d00680-4ab1-11ea-8449-c8de4036aa7e.png">

### 추가한 기능

* 오토레이아웃 사용을 위해 다음과 같은 코드 추가

  * ```swift
    translatesAutoresizingMaskIntoConstraints = false
    ```

  * 스토리보드에서 constraint를 설정해주면 위 코드가 자동으로 실행 되지만, viewController에서 코드로 constraint를 적용해주면 자동으로 실행 안됨.

  

* 배경 이미지 설정

  ``` swift
  self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
  self.view.addSubview(stackView)
  ```

  asset에 있는 bg_pattern이라는 이미지를 불러와서 패턴 이미지를 배경으로 설정 해줌

  

* 카드 이미지 추가

  * rootView에 stackView를 삽입하여 여러장의 imageView를 추가할 수 있게 함.

    ```swift
    self.view.addSubview(stackView)
    ```

  * stackView에 constraint를 설정하여 디스플레이의 크기가 달라져도 항상 동일한 비율 유지하도록 함.

    ``` swift
    self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive=true
    self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive=true
    self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive=true
    ```

  * imageView의 constraint를 설정하여 항상 가로 : 세로의 비율이 1:1.27이 되도록 설정

    ``` swift
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive=true
    ```

    

    

  

2020.02.08

