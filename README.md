# LENA의 Poker Game App

# Poker Game App 

객체지향 프로그래밍(Object-Oriented Programming)

- 입력받은 좌표수에 따라 직선, 삼각형, 사각형 중 어떠 도형인지 결정한다.
- 도형의 길이 또는 넓이를 계산하여 출력한다.

## 목차

- [pokergameapp-step1](#pokergameapp-step1): StackView를 통해 동일한 비율의 7개 카드(뒷면)가 동일한 간격으로 수평으로 나열 


### pokergameapp-step1
02.08 23:30


1. 코드로 StatusBar 스타일을 LightContent로 변경

  ```swift
   override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
   }
  ```

  ![](https://i.imgur.com/nP2o4mY.png)
  (왼쪽 스냅샷 : 설정 전, 오른쪽 스냅샷 : 설정 후)

2. view 배경에 들어갈 패턴 이미지를 Assets에 추가 후, 패턴 이미지 적용
![](https://i.imgur.com/hwgvBE0.png)

3. 카드 뒷면 이미지 Assets에 추가

02.09 18:50

![image-20200209190050604](/Users/keunnalee/Library/Application Support/typora-user-images/image-20200209190050604.png)

4. ViewController 클래스에서 코드로 화면을 균등하게 7등분해서 7개 UIImageView를 추가
   : 뷰를 7개 만들어서 Auto Layout으로 직접 하나하나 제약을 설정하는 방법 외에 다른 방법을 찾다가 UIStackView를 알게되서 StackView를 사용해서 구현.
- 4-1 StackView 생성
  : StackView.translatesAutoresizingMaskIntoConstraints = false로 설정 변경.
  axis(배치 방향 설정하는 속성)을 수평으로 설정.
  distribution(Axis와 동일한 축에서 subView의 크기와 배치방식 설정하는 속성)을 Fill Equally로 설정.
  spacing(수평/수직 간격 설정하는 속성) 설정.
- 4-2 card 생성 
: 가로 세로 비율을 1:1.27로 설정.
  비율을 유지하도록 Content Mode를 scaleAspectFit로 설정.
- 4-3 7개의 card를 만들어 StackView에 추가 
- 4-4 StackView 제약 설정

5. RootView에 Subview로 StackView 추가 