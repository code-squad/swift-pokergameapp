# swift-pokergameapp
포커게임 앱 저장소



## Step1 - A tabbed app

2020/Feb/05

- 배경 패턴 이미지 지정

  - ```swift
    UIColor(patternImage: #UIImage)
    ```

- `UIImageView`를 생성하는 함수 생성

  - 카드 가로:세로 비율 설정
  - autoLayout 을 위해 `translatesAutoresizingMaskIntoConstraints` 설정

- 카드 이미지들을 담을 `UIStackView` 생성

- `UIStackView`에 AutoLayout 적용

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step1.png?raw=true" width="240px">

## Step2 - Card class

2020/Feb/05

- Card class 추가
- Nested enum class를 사용해 Suit, Rank type 구현
- Card class에 출력을 위한 toString() 함수 구현
- Card class의 테스트 객체 생성 및 Card 정보 출력

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step2-1.png?raw=true" width="440px">

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step2-2.png?raw=true" width="380px">