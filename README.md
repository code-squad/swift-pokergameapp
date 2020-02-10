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
- Card instance의 정보 출력을 위해 CustomStringConvertible Protocol 사용
- Card class의 테스트 객체 생성 및 Card 정보 출력

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step2-1.png?raw=true" width="440px">

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step2-2.png?raw=true" width="380px">

<br>

## Step3 - Impementing CardDeck & Testing

2020/Feb/06

- CardDeck class 구현
- `setupDeck()`, `shuffle()`, `removeOne()`, `reset()`, `count` 함수 및 프로퍼티 구현
- 모든 카드를 뽑았을 수도 있기 때문에 `removeOne()` 반환타입을 `Card?` 로 지정

<br>

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step3-1.png?raw=true" width="380px">
<br>
<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step3-2.png?raw=true" width="380px">
<br>
<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step3-3.png?raw=true" width="380px">



## Step4 - Poker Dealer & Testing Games

2020/Feb/10

- PokerGame, Dealer, Player 모델 생성
- PokerGame 초기화 -> Players, Dealer 초기화
- Dealer의 Initializer에서 Player에게 패 전달
- PokerGame 인스턴스로 게임 진행 테스트

#### class PockerGame

```swift
class PokerGame {
    let gameType: GameType
    let numberOfPlayers: Int
    var players: [Player] = []
    let dealer: Dealer
    
    init(type gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
        for _ in 0..<numberOfPlayers { players.append(Player()) }
        self.dealer = Dealer(numberOfHands: gameType.numberOfHands, players: players)
    }
    
    enum GameType: Int {
        case sevenCardsStud = 7
        case fiveCardsStud = 5
        
        var numberOfHands: Int {
            self.rawValue
        }
    }
}
```

#### class Dealer

```swift
class Dealer {
    var deck = CardDeck()
    let numberOfHands: Int
    let players: [Player]
    var communityCards: [Card] = []
    
    init(numberOfHands: Int, players: [Player]) {
        self.numberOfHands = numberOfHands
        self.players = players
        
        setupHands()
        setupCommunityCards()
    }
    
    func setupHands() {
        players.forEach {
            passHands(to: $0)
        }
    }
    
    func setupCommunityCards() {
        for _ in 0..<numberOfHands {
            guard let card = deck.removeOne() else { return }
            communityCards.append(card)
        }
    }
    
    func passHands(to player: Player) {
        for _ in 0..<numberOfHands {
            guard let card = deck.removeOne() else { return }
            player.hands.append(card)
        }
    }
}
```

#### Test

PokerGame 객체로 게임을 진행했을 때, Player와 Dealer의 패, 커뮤니티카드 세팅을 정상적으로 작동되는지 테스트

```swift
    func testFiveCardsStud() {
        let pokerGame = PokerGame(type: .fiveCardsStud, numberOfPlayers: 4)
        
        pokerGame.players.enumerated().forEach { (i, player) in
            print("참가자#\(i+1) \(player.hands)")
        }
        print("딜러 \(pokerGame.dealer.communityCards)")
    }
```

<br>

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step4-1.png?raw=true" width="380px">
<br>
<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step4-2.png?raw=true" width="380px">