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

2020/Feb/11

- PokerGame, Dealer, Player 모델 생성
- PokerGame 초기화 -> Dealer 초기화 -> Dealer에서 패를 뽑는다.
- Dealer에서 뽑은 패를 PokerGame에서 Dealer에게 전달
- PokerGame 인스턴스로 게임 진행 테스트

#### class PockerGame

```swift
class PokerGame {
    let gameType: GameType
    let numberOfPlayers: Int
    var players: [Player] = []
    let dealer: Dealer
    
    init(game gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
        self.dealer = Dealer(game: gameType)
        setupHands()
    }
    
    private func setupHands() {
        setupPlayersHands()
        dealer.setupCommunityCards()
    }
    
    private func setupPlayersHands() {
        for _ in 0..<numberOfPlayers {
            guard let hands = dealer.drawHands() else {
                print("카드가 부족합니다.")
                return
            }
            players.append(Player(hands: hands))
        }
    }
}

enum GameType: Int {
    case sevenCardsStud, fiveCardsStud
}
```

#### class Dealer

```swift
class Dealer {
    private let gameType: GameType
    private var deck = CardDeck()
    private var _communityCards: [Card] = []
    
    var communityCards: [Card] {
        _communityCards
    }
    
    init(game gameType: GameType) {
        self.gameType = gameType
        setupDeck()
        setupCommunityCards()
    }
    
    func setupDeck() {
        deck.shuffle()
    }
    
    func setupCommunityCards() {
        guard let hands = drawHands() else {
            print("카드가 부족합니다")
            return
        }
        _communityCards = hands
    }
    
    func drawHands() -> [Card]? {
        var hands: [Card] = []
        var numberOfHands = 0
        switch gameType {
        case .fiveCardsStud:
            numberOfHands = 5
        case .sevenCardsStud:
            numberOfHands = 7
        }
        
        for _ in 0..<numberOfHands {
            guard let card = deck.removeOne() else { return nil }
            hands.append(card)
        }
        
        return hands
    }
}
```

#### Test

PokerGame 객체로 게임을 진행했을 때, Player와 Dealer의 패, 커뮤니티카드 세팅을 정상적으로 작동되는지 테스트

```swift
    func testSevenCardsStud() {
        let pokerGame = PokerGame(game: .sevenCardsStud, numberOfPlayers: 4)
        
        XCTAssert(pokerGame.players.count == 4)
        pokerGame.players.forEach {
            XCTAssert($0.hands.count == 7)
        }
        
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



## Step5 - Result View

2020/Feb/11

- Card 객체는 참조가 필요없다고 판단하여 struct로 수정
- Card 객체와 이미지 파일명은 CustomStringConvertible을 활용하여 매치
- StackView 3개를 이용한 화면 구성
- View들을 다른 클래스로 구현하여 분리하려고 노력함
- Dealer와 Player를 같은 대등한 관계에서 처리할 수 있도록 프로토콜을 만들어 두 클래스가 채택하도록 함
- shake 모션에 따라 게임 reset

<br>

#### protocol: Playable

```swift
protocol Playable {
    var hands: [Card] { get set }
}
```

<br>

#### shake

```swift
override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        resetPokerGame()
    }
```

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step5-1.png?raw=true" width="380px">

<img src="https://github.com/corykim0829/swift-pokergameapp/blob/corykim0829/Screenshots/step5-2.png?raw=true" width="380px">

