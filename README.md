# 포커게임 앱



## step-1

- 설명

  - 포커게임의 배경화면을 지정해주기 위해 UIColor(patternImage:)메소드를 사용하였습니다.
  - 그리고 7장의 카드를 나란히 나열하기위해 스택뷰와 오토레이아웃을 사용하였습니다. 그 전에 카드 이미지를 UIImageView로 생성하는 메소드를 작성하였습니다.
  - 그 후 스택뷰를 생성하고 반복문을 사용하여 카드 이미지(ImageView)들을 넣어주었습니다.
  - 그리고 스택뷰를 화면 상단에 놓여질 수 있도록, 그리고 화면 중앙에 놓여질 수 있도록하기위해  오토레이아웃을 코드로 작성하였습니다.

  

- 실행화면

  <img width="300" alt="스크린샷 2021-02-15 오후 9 03 24" src="https://user-images.githubusercontent.com/42647277/107944339-4b78fb80-6fd1-11eb-8623-5f111a7b8b7d.png">

- 완성 날짜시간

  2021/02/15 21:10



## step-2

- 설명

  - 카드를 모델링하기위해 Card라는 Class생성하였다.
  - 이후 카드의 속성인 모양과 숫자를 모델링하기위해 Nested enum을 사용하였다.
  - 임의의 카드 정보를 출력하기위해 drawingCardRandomly() 메소드 생성하였다.
  - 열거형의 케이스들을 임의로 사용하기위해 Suit과 Rank열거형에 CaseIterable프로토콜을 채택하였다.

  

- 실행화면

  <img width="784" alt="스크린샷 2021-02-16 오후 12 07 41" src="https://user-images.githubusercontent.com/42647277/108014334-fd0b4180-7050-11eb-8259-7c4c09eef006.png">

- 완성 날짜시간

  2021/02/16 12:18



## step-3

- 설명
  - Card들을 담고 여러기능들을 추가하기 위해 CardDeck이라는 구조체 생성
  - CardDeck안에 셔플, 랜덤 카드 한장 뽑기, 초기화하기 기능들을 추가하였다.
  - Card에 CustomStringConvertible 프로토콜을 채택하였다.
  - 객체지향적인 코드를 작성하기 위해 객체의 속성들은 private사용하여 숨겨주었다.



- 실행화면

  <img width="318" alt="스크린샷 2021-02-16 오후 6 03 52" src="https://user-images.githubusercontent.com/42647277/108041668-314b2600-7082-11eb-9ec9-76cab7d97ee5.png">

- 완성 날짜시간

  2021/02/16 18:09



## step-4

- 설명
  - PokerGame 클래스를 만들고 그 안에 카드덱, 플레이어들, 딜러 프로퍼티를 생성하였다.
  - 게임을 시작하기 위한 준비과정 readyToGameStart(), 플레이어 인스턴스를 생성하기 위한 participate() 메소드를 생성하였다.
  - PokerGame안에 nestedType으로 Player와  Dealer 클래스를 생성하였다.
  - readyToGameStart() 메소드는 우선 카드덱을 셔플하고, 셔플한 카드덱으로부터 각 플레이어들에게 카드를 나눠주고, 마지막으로 딜러까지 카드를 받는 기능을 코드이다.
  - ViewController에 testSevenCardStud()메소드를 생성하여 참가자들과 딜러의 카드를 출력하는 코드를 작성하였다.



- 실행화면

  <img width="894" alt="스크린샷 2021-02-17 오후 5 48 49" src="https://user-images.githubusercontent.com/42647277/108178987-6cb02800-7148-11eb-9213-264451c0a1a5.png">

  

- 완성날짜시간

  2021/02/17 17:50
