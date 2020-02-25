# swift-pokergameapp

## 2020.02.11
### step-1
1. StatusBar LightContent로 변경
2. 배경이미지 Assets에 등록 후 BackgroundPattern이라고 명명
3. 배경을 이미지패턴으로 지정    
<img width="200" src="https://user-images.githubusercontent.com/49548908/74218125-c0459580-4cec-11ea-9cf9-00422815ef5c.png">

4. 카드 뒷면 이미지 Assets에 등록 후 CardBackground라고 명명
5. 카드 세로 가로 비율 1:1.27 로 지정, 균일하게 7등분하여 7개의 이미지(카드뒷면) 추가   
<img width="300" src="https://user-images.githubusercontent.com/49548908/74219057-0c91d500-4cef-11ea-884a-f1eb0f63c07e.png">
<img width="300" src="https://user-images.githubusercontent.com/49548908/74219027-f08e3380-4cee-11ea-8247-f5d7e73fe3c1.png">

<br>

### step-2 (2020.2.12 11:00 ~ 15:50)
1. JK 리뷰를 토대로 리팩토링 진행(클래스 프로퍼티에 private사용, 함수를 조금 더 나눠 봄)
2. Card Class 설계 시작
3. ```Nested Enum```을 사용해서 카드의 suit와 rank를 만들었으나, 어떻게 활용해야하는지 몰라 검색 ~~(삽질 1)~~
4. 삽질 중 ```CustomStringConvertible protocol```을 찾아 공식문서 및 기타 블로그 활용하여 어떻게 사용하는지 확인 ~~(삽질 2)~~
5. Card Class를 확장하여 ```CustomStringConvertible protocol```을 채택 및 description 프로퍼티를 구현하여 준수함.
6. description 프로퍼티는 suit, rank 순으로 나오도록 정의

<br>

### step-3 (2020.2.13)
1. step2 리팩토링, Card Class에서 모든 enum에 대한 rawValue를 참조하지 말고 각 enum에서 CustomStringConvertible 프로토콜을 채택해서 description을 return하게 해준다.
역할을 나눔.
2. CardDeck이라는 구조체 생성, 52개의 카드를 배열에 넣어주는 초기화 작업까지 완료.
3. count() 함수, 덱 개수 반환
4. shuffle() 함수, 덱 랜덤으로 섞음
5. reset() 함수, 덱 초기화
6. 테스트 코드를 작성 했으나...맞는건지 모르겠음..

### step-4 (2020.2.17)
1. GameTable Class 생성 (CardGame.swift)
- 딜러제외 플레이어수
- 카드 studType
- 딜러
- 전체 참가자 배열(딜러도 포함해야함)
- initializer에서 전체 참가자 세팅 및 studType에 맞게 카드 분배를 해줌.
2. Player Class를 만듦.
- 자기 손에 들고있는 카드덱(handDeck)
- 카드를 가져와 자기 손에 넣는 함수 bringCard 추가 (딜러가 나눠준 카드를 받음.)
3. Dealer Class를 만듦.
- Player Class를 상속받음, Player와 같은 속성이나 Dealer가 하는일은 좀 더 추가가 됨.
- 카드 섞기(shuffle), 카드 나눠주기(drawCard), 카드개수 확인하기(checkCardAmount)

### step-5 (2020.2.25)

1. SegmentedControl 추가
   - studType, playerEntry을 선택 할 수 있는 SegmentedControl 2개 추가.
   - 선택하면 text색을 검정색, 선택하지 않았을때 흰색으로 설정.
   - border 흰색으로 설정
   - 초기선택은 0번째 index로 설정
   - ViewController에서 설정 및 생성을 해줬으나 너무 커지는것 같아 studType, playerEntry SegmentedControl을 각각 분리함.
   - 분리하고 보니 코드가 같아 CustomSegmentedControl로 통합하여 해당 객체를 생성하여 사용. 

3. Label
   - Label에 들어가는 text를 viewController에서 만들어준다음 넣어주려고 했으나, viewController에서 해주는게 맞지 않다고 판단.
   - Player 프로퍼티에 이름을 넣어서 객체가 생성될때 player name을 넣어주도록 변경(ex. player1, player2.....)
   - Dealer는 "Dealer"가 이름이 되도록 한다.
   - label로 불러와야 하므로 private(set) 으로 접근제어 하도록 변경

4. StackView
   - 현재 최상위 스택뷰(GameStackView)안에 PlayerInfoStackView가 플레이어 수만큼 들어가있고, PlayerInfoStackView안에는 Label과 CardImg들을 가지고있는 CardGameStackView 이렇게 구성되어 있음.
   - SegmentedControl 과 마찬가지로 ViewController에서 설정 및 생성하였으나 View 객체를 만들어 내부에서 Label 생성, 카드이미지를 넣는 스택뷰, Label과 카드이미지스택뷰를 묶는 플레이어스택뷰, 마지막으로 플레이어수만큼 플레이어스택뷰를 가지고 있는 최상위 스택뷰를 만듦.
   - ViewController에서는 단지 해당 UIStackView객체를 가지고 view에 추가, 제약사항만 추가해주면 된다.

5. Players
   - 기존 GameTable에서 players를 Player타입의 배열로 생성하여 사용하였으나 Players라는 객체를 만들어서 사용하도록 변경
   - GameTable에서 player 추가, 초기 카드 세팅은 Players에서 이루어지도록 변경
   - 배열 다루는건 Players에서 이루어지도록 한다.

6. 동작 확인
<img width="250" src="https://user-images.githubusercontent.com/49548908/75263064-cbdaa580-5830-11ea-88ab-fc7f57447ec9.gif">
