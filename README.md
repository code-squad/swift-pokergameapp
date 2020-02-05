# swift-pokergameapp
포커게임 앱 저장소



## Step1 - A tabbed app

2020.02.5

- 배경 패턴 이미지 지정

  - ```swift
    UIColor(patternImage: #UIImage)
    ```

- `UIImageView`를 생성하는 함수 생성

  - 카드 가로:세로 비율 설정
  - autoLayout 을 위해 `translatesAutoresizingMaskIntoConstraints` 설정

- 카드 이미지들을 담을 `UIStackView` 생성

- `UIStackView`에 AutoLayout 적용

<img src="https://github.com/corykim0829/swift-pockergameapp/blob/corykim0829/Screeenshots/step1.png?raw=true" width="240px">