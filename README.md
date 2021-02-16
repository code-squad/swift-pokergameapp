# swift-pokergameapp
## 게임판 만들기

요구사항  

1. StatusBar 스타일을 LightContent
2.  self.view 배경 이미지 패턴으로 지정
3. ViewController 클래스에서 코드 UIImageView를 뒷면 카드 추가 및 가로와 세로 비율은 1:1.27 지정

<img width="893" alt="스크린샷 2021-02-15 오후 4 54 36" src="https://user-images.githubusercontent.com/33626693/107919386-90d80180-6fae-11eb-9e24-e1eb45762021.png">

21.02.15 

## 카드 클래스

요구사항 

카드  객체 인스턴스를 만들어서 콘솔에 출력

<img width="1032" alt="스크린샷 2021-02-15 오후 7 54 45" src="https://user-images.githubusercontent.com/33626693/107937738-af96c200-6fc7-11eb-9eee-5f3bcfe9216f.png">

21.02.15 

## 카드덱 구현과 테스트

요구사항

객체지향 설계 맞도록 내부 속성을 감추고 인터페이스만 보이도록 구현

<img width="945" alt="스크린샷 2021-02-16 오전 11 29 37" src="https://user-images.githubusercontent.com/33626693/108011480-8408eb80-704a-11eb-9790-8f0a4653297f.png">

클래스 구조체 차이

##  Struct

- **값(Value)** Type
  \- `Value` 이기에 `multi-thread` 환경에서 공유 변수로 인한 문제를 일으킬 확률이 적다.
- `Stack memory` 사용
  \- 속도가 빠르다.
  \- `Complier`의 메모리 할당/해제가 정확하다.
- `let` 으로 초기화 이후에 **값 변경이 불가능**

## Class

- **참조(Reference)** Type
- **상속** 가능
  \- 상속이 가능하기에 타입캐스팅도 허용된다.
- `deinitalize`도 구현 가능
- `Heap memory` 사용
  \- 속도가 느리다.
- `let` 으로 초기화 이후 **값 변경 가능**
- `class` 인스턴스에 **하나 이상 참조 가능**
- **식별 연산자(===)** 사용 가능
  \- 상수와 변수가 **같은 인스턴스를 참조하고 있는지 비교**하기 위해 식별 연산자를 사용

21.02.16

## 포커 딜러와 게임 테스트

<img width="773" alt="스크린샷 2021-02-16 오후 9 08 03" src="https://user-images.githubusercontent.com/33626693/108061163-42546100-709b-11eb-8142-1c8d72d33fcc.png">

