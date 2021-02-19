# swift-pokergameapp


#### 요구사항
- StatusBar 스타일 LightContent
- Background를 이미지 패턴으로 설정
- 카드 뒷모습 ImageView 가로세로(1:1.27)로 생성

#### 해결방법
- StatusBar 스타일 LightContent
  - 코드로 지정(해당 vc)
  - Info.plist로 지정(앱전체)
- Background를 이미지 패턴으로 설정
  - 1x 2x 3x 이미지 적용
- 카드 뒷모습 ImageView 생성
  - 스택뷰와 오토레이아웃 적용

![스크린샷 2021-02-16 오후 1 57 24](https://user-images.githubusercontent.com/73683735/108020135-0a2f2d00-705f-11eb-9fa3-035557116596.png)

#### 완료날짜 2021년 02월 16일(화) 14:00

---
---

# 카드 클래스


#### 요구사항
- 카드 클래스 생성
- 콘솔에 카드 출력

#### 해결방법
- 카드 클래스 생성
  - 카드의 모양이나 숫자는 범위가 지정된 값 내에서 사용되어야 하므로 enum타입 사용 
- 콘솔에 카드 출력
  - CustomStringConvertible 사용, enum에도 CustomStringConvertible 사용할 수 있었다.

![스크린샷 2021-02-17 오후 3 04 50](https://user-images.githubusercontent.com/73683735/108162990-9578f300-7131-11eb-8b16-5dce2d4907d3.png)

#### 완료날짜 2021년 02월 17일(수) 14:00

---
---

# 카드덱 구현과 테스트


#### 요구사항
- 카드덱 구현
- 카드 뽑기, 카드 섞기, 카드 초기화, 카드 갯수 세기 기능 추가

#### 해결방법
- 카드덱 구현

  - enum에도 CustomStringConvertible 프로토콜을 구현할 수 있었다.

- 카드 뽑기, 카드 섞기, 카드 초기화, 카드 갯수 세기 기능 추가

  - 카드 섞기 : Fisher-Yates shuffle의 현대버전인 Knuth Shuffle 구현

  - 카드 갯수 세기 : 클로저를 이용해서 count 변수를 선언 하였다.

  - 카드 초기화 : enum에 CaseIterable 프로토콜을 적용하여 모든 case을 가져와서 foreach문으로 모든 카드 객체를 생성 했다.

  - 카드 뽑기 : Debug Memory graph로 스냅샷을 찍어서 객체의 생성과 소멸 알아봄

    >  단점: 스냅샷 한번밖에 안찍힘  -> Instruments 이용하면 해결

- 카드덱 테스트 코드를 상위 모듈에서 테스트

  > 상하위 모듈 관계는 포함적인 관계. 의미적으로 생각하면 쉬움
  >
  >  테스트게임하기 - 카드덱 // 테스트게임 안에 카드덱이 포함되지? 테스트게임 객체안에 카드덱 객체 생성해서 테스트 하였음.

![스크린샷 2021-02-18 오후 3 49 15](https://user-images.githubusercontent.com/73683735/108316951-f02d5000-7200-11eb-899a-b3c1820236d2.png)

#### 완료날짜 2021년 02월 17일(수) 23:58

---
---

# 포커 딜러와 게임 테스트

#### 요구사항
- Dealer, Player, Players, PokerGame 클래스 생성
- 객체 지향 프로그램을 연습한다.

#### 해결방법
- Dealer, Player, Players, PokerGame 클래스 생성
  - Dealer, Player : 공통적인 메소드를 Playable 프로토콜을 사용하여 일반화 하였다. 상속은 안썻음 딜러와 플레이어는 상하관계아니니까..
  - 객체의 각 속성에 private 접근지정을 해서 외부 변경으로부터 보호 했다. 
     > Dealer랑 Player에 [Card] 공통 속성있길래 protocol에 넣었더니 private 못씀.. 그래서 뺌!
  - 지정된 값만 사용하기 위해 enum 사용 enum에도 프로토콜, 연산프로퍼티를 사용해서 rawValue() 사용을 지양했다.

![스크린샷 2021-02-19 오후 8 35 04](https://user-images.githubusercontent.com/73683735/108499767-27c7f500-72f2-11eb-8f30-fa3fc4d74001.png)

#### 완료날짜 2021년 02월 19일(금) 18:00

