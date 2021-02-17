## Step 1
- info.plist 설정에서 status bar 스타일을 LightContent로 변경
- 배경을 image pattern으로 지정
- 7개의 card image view를 stack view에 담고, stack view에 대한 autolayout을 추가
<img width="291" alt="step1" src="https://user-images.githubusercontent.com/75113784/107923230-8ae51f00-6fb4-11eb-9ec5-c7478e323aa8.png">

## Step 2
- Card class 구현
- Nested enum `Shape`와 `Number`를 선언하고, `CustomStringConvertible`을 채택해서 의도한대로 출력하도록 추가

## Step 3 - CardDeck, Test
- CardDeck `struct` 구현
- CardDeck이 `Card` 클래스의 인스턴스를 배열로 갖고 있도록 설계
- Card의 nested enum case를 모두 구하기 위해 `CaseIterable` 프로토콜을 채택하도록 추가
- CardDeck의 cards 배열 셔플을 위해 `Fisher-Yates` 알고리즘을 `shuffle` 함수 안에 구현
- Test 코드 작성을 위해 `TestCardDeck` 구조체를 선언하고, `testWithScenario()`로 테스트 함수를 작성

### Test code result
```
카드 전체를 초기화했습니다.
총 52장의 카드가 있습니다.
전체 52장의 카드를 섞었습니다.
♣️6
총 51장의 카드가 남아있습니다.
♠️4
총 50장의 카드가 남아있습니다.
```

## Step 4 - PokerGame, Test
- PokerGame `class` 구현
- CardDeck과 Player 객체를 활용해 player에게 handCard를 나눠주고 리셋하는 함수를 추가
- `PlayerType`에 따라 player와 dealer를 구분할 수 있도록 nested enum 추가
```
7카드 기준, 참가자 3명 일 때 

player: [♣️5, ♦️A, ♦️4, ♠️A, ♥️3, ♥️5, ♣️K]
player: [♦️2, ♣️8, ♠️Q, ♣️7, ♥️8, ♠️3, ♠️6]
player: [♠️4, ♣️6, ♦️7, ♠️J, ♥️2, ♣️2, ♦️8]
dealer: [♥️10, ♦️6, ♠️8, ♠️K, ♠️9, ♦️9, ♦️Q]
```
