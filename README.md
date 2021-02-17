# swift-pokergameapp

## step 1. 게임판 만들기

### 주요 작업
- Card Struct 생성 - cardBack: UIImageView 속성 선언 후 초기화
- Hand Class 생성 - horizontal stackview 선언 후 Card갯수에 맞게 추가 후 정렬
- VC에서 Hand 뷰 추가 후 렌더링

### 스크린샷

![Simulator Screen Shot - iPhone 12 Pro - 2021-02-15 at 18 01 28](https://user-images.githubusercontent.com/39956881/107926053-920e2c00-6fb8-11eb-8aa2-b8f887a706b0.png)

## step 2. 카드 클래스

### 주요 작업
- CardImage 구조체와 Card구조체 분리
- Suit 열거형 추가
- CardValue 구조체 추가
- Card 구조체에서 카드 인스턴스 출력 행동 추가

### 스크린샷

<img width="229" alt="스크린샷 2021-02-15 오후 10 52 56" src="https://user-images.githubusercontent.com/39956881/107955013-98180300-6fe0-11eb-89a3-29433742a776.png">


## step 3. 카드덱 구현과 테스트

### 주요 작업
- CardDeck구조체를 생성

- CardDeck구조체 내부 속성 감추고 인터페이스만 보이도록 구현
1. count 갖고 있는 카드 개수를 반환한다.
2. shuffle 기능은 전체 카드를 랜덤하게 섞는다.
3. removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
3. reset 처음처럼 모든 카드를 다시 채워넣는다.

- CardDeck 인터페이스 테스트 코드 작성

## step 4. 포커 딜러와 게임 테스트

### 주요 작업
- 포커 게임을 진행하는 PokerGame class 생성
- 포커 게임에 필요한 Dealer, Player class 생성
- 포커 게임 중 정보를 보여주는 PokerGameBoard struct 생성
- 포커 게임 진행에 맞게 CardDeck 메서드 수정
- 테스트 코드 수정 및 추가

### 스크린샷

<img width="520" alt="스크린샷 2021-02-17 오후 3 19 35" src="https://user-images.githubusercontent.com/39956881/108164399-10430d80-7134-11eb-988f-fdfbc54d652f.png">
