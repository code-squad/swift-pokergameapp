# swift-pokergameapp
STEP15 포커게임 앱 저장소

#### 1. StatusBar 스타일 변경
```swift
override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
```

StatusBar 의 스타일이 설정된 변수를 override 해서 lightContent 로 설정해줌

#### 2. 배경 패턴 생성
```swift
view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
```

UIColor 로 이미지 패턴을 만들어주고 view 의 배경으로 설정해줌

#### 3. 카드 구현
```swift
var cardStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.distribution = .fillEqually
    stack.axis = .horizontal
    stack.spacing = 5
    return stack
}()
```
카드들을 담을 UIStackView 를 만들어 주고, distribution, axis, spacing 의 값을 설정해줌
```swift
func makeCards() {
    for _ in 0..<7 {
        let card = UIImageView(image: #imageLiteral(resourceName: "card-back"))
        card.contentMode = .scaleAspectFit
        cardStack.addArrangedSubview(card)
    }
}
```
UIImageView 로 카드를 만들고 cardStack 에 담아줌
원본 이미지의 비율을 유지하기 위해 contentMode 를 .scaleAspectFit 으로 해줌
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    makeCards()
    view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    self.view.addSubview(cardStack)
    cardStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
    cardStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
    cardStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
}
```
makeCards() 로 카드를 만들어 스택에 담아주고 스택뷰를 뷰 위에 추가해줌
스택뷰의 위치를 기존 뷰를 기준으로 정해줌

<img width="442" alt="스크린샷 2020-02-06 오후 8 02 20" src="https://user-images.githubusercontent.com/50410213/73932149-0f6e7d80-491d-11ea-94ef-206edcced0cd.png">

#### 4. 카드 클래스 구현
```swift
class Card {
    var shape: Shape
    var rank: Rank

    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    enum Shape: String {
        case heart = "♥︎", spade = "♠︎", clover = "♣︎", diamond = "♦︎"
    }
    
    // enum 을 중첩해서 사용하여 A, J, Q, K 와 숫자들을 구분해뒀었는데 생각해보니 나중에 포커게임을 구현할 때 연속된 숫자임을 확인하기 위해선 모두 Int 타입의 RawValue 를 가져야할것같아 수정해주었습니다.
    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(shape.rawValue)\(rank)"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
}
```

Card 클래스에 CustomStringConvertible 프로토콜을 채택해줘서 정보에 맞게 문자열로 변환

<img width="470" alt="스크린샷 2020-02-07 오후 5 09 17" src="https://user-images.githubusercontent.com/50410213/74012058-b52cf580-49cc-11ea-85dc-8ec158ab2d1f.png">
<img width="273" alt="스크린샷 2020-02-07 오후 5 09 07" src="https://user-images.githubusercontent.com/50410213/74012053-b3fbc880-49cc-11ea-9cfb-187f702e138c.png">

#### 5 - 1. 카드덱 구현
```swift
struct Deck {
    private var cards = [Card]() {
        didSet {
            print("총 \(count)장의 카드가 남아있습니다.")
        }
    }
    var count: Int {
        cards.count
    }
    
    init() {
        reset()
    }
    
    mutating func reset() {
        cards = [Card]()
        Card.Shape.allCases.forEach {
            let shape = $0
            Card.Rank.allCases.forEach {
                cards.append(Card(shape: shape, rank: $0))
            }
        }
    }
    
    mutating func removeOne() -> Card? {
        guard count > 0 else {
            print("카드가 없어요")
            return nil
        }
        let card = cards.removeLast()
        return card
    }
    
    mutating func shuffle() {
        guard count > 2 else { return }
        let beforeShuffle = cards
        while beforeShuffle == cards {
            cards.shuffle()
        }
    }
}
```
* property observer 로 카드 덱에 변화가 생길 때마다 남은 장수 출력
* count 는 카드 배열의 갯수를 반환하는 연산 프로퍼티로 만들어줌
* 구조체 내부 데이터를 수정해주기위해 mutating func 으로 함수들 선언
* reset() - 카드가 담긴 배열을 초기화해주고 카드들을 담아줌
* removeOne() - 카드가 남아있는지 여부를 확인하고 있다면 뽑아주고 없으면 nil 을 반환
* shuffle() - 카드를 섞어줌


#### 5 - 2. 테스트

```swift
extension Card: CustomStringConvertible, Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
    
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(shape.rawValue)\(rank)"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
}
```

```swift
extension Deck: Equatable {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        for index in 0..<lhs.count {
            if "\(lhs.cards[index])" != "\(rhs.cards[index])" {
                return false
            }
        }
        return true
    }
}
```
* 유닛 테스트에서 덱이 같은지 여부를 확인하기위해 Card 와 Deck 에 Equatable 프로토콜을 채택해줌

```swift
@testable import CardGameApp
import XCTest

class DeckTest: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }
    
    func testShuffle() {
        let beforeShuffle = deck
        var isItDifferent = 0
        for _ in 1...100 {
            deck.shuffle()
            if deck != beforeShuffle {
                isItDifferent += 1
            } else {
                isItDifferent -= 1
            }
        }
        XCTAssertGreaterThan(isItDifferent, 0)
    }
    
    func testReset() {
        var anotherDeck = Deck()
        deck.reset()
        anotherDeck.reset()
        XCTAssertEqual(deck, anotherDeck)
    }
    
    func testRemoveOneAndCount() {
        let beforeRemove = deck.count
        for count in 1...beforeRemove {
            if let card = deck.removeOne() {
                print(card)
                XCTAssertEqual(beforeRemove - count, deck.count)
            }
        }
        XCTAssertNil(deck.removeOne())
    }
}
```
* Deck 의 기능을 테스트하기 위한 코드
* shuffle 은 섞고 난 후에도 같은 결과가 나올 수 있기 때문에 shuffle 을 여러번 수행한 결과를 보고 테스트

```swift
@testable import CardGameApp
import XCTest

class IntegrationTest: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }

    func testIntegration() {
        let initialDeck = deck
        deck.reset()
        XCTAssertEqual(deck.count, 52)
        deck.shuffle()
        XCTAssertNotEqual(deck, initialDeck)
        deck.removeOne()
        XCTAssertEqual(deck.count, 51)
        deck.removeOne()
        XCTAssertEqual(deck.count, 50)
    }
}
```
* 각각의 기능을 테스트하기위한 코드와 통합 테스트를 나눠줌

#### 6 - 1. 포커 딜러와 게임

1. Player 클래스
```swift
class Player {
    var hand = [Card]()
    
    func initHand() {
        hand = [Card]()
    }
}
```
* 카드들을 가지고있을 핸드와 게임을 재시작 할 때 핸드를 초기화해줄 initHand() 를 만들어줌

2. Dealer 클래스
```swift
class Dealer: Player {
    var deck = Deck()
    var drawnCard: Card?
    
    func drawCard() {
        drawnCard = deck.removeOne()
    }
    
    func shuffle() {
        deck.shuffle()
    }
}
```
* 딜러도 게임에 참여하기 때문에 Player 클래스를 상속받게 해줌
* 딜러가 플레이어들에게 카드를 나눠줘야 하므로 Deck 을 딜러에게 줌
* 덱에서 카드를 뽑아서 drawnCard 에 담는 drawCard()
* 덱을 섞어주는 shuffle()

3. PokerGame 클래스
```swift
class PokerGame {
    var dealer = Dealer()
    var players = [Player]()
    var numberOfPlayers: Int
    var gameType: GameType
    var resumable: Bool {
        dealer.deck.count > (players.count) * gameType.rawValue
    }
    
    init(gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
    }
    
    enum GameType: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    func addPlayers() {
        for _ in 1...numberOfPlayers {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    func distributeCards() {
        players.forEach {
            dealer.drawCard()
            guard let drawnCard = dealer.drawnCard else {
                return
            }
            $0.hand.append(drawnCard)
        }
    }
    
    func initHand() {
        players.forEach {
            $0.initHand()
        }
    }
    
    func play() {
        initHand()
        dealer.shuffle()
        for _ in 1...gameType.rawValue {
            distributeCards()
        }
    }
    
    func run() {
        addPlayers()
        while resumable {
            play()
        }
    }
}
```
* 딜러 한명과 플레이어들을 담을 배열 players
* 게임 참여 인원수 numberOfPlayers, 7카드스터드와 5카드스터드 구분을 위한 gameType
* gameType 은 enum 으로 만들어 게임 종류를 제한해줌
* PokerGame 을 생성할 때 참여인원수와 게임타입을 정해줌
* addPlayers() - players 에 참여인원수만큼 플레이어를 추가해주고 마지막에 딜러를 추가해줌
* distributeCards() - 딜러가 카드를 한장씩 뽑아 플레이어들에게 나눠줌
* initHand() - 플레이어들의 손패를 초기화
* play() - 플레이어들의 손패를 초기화 한 후 덱을 섞어주고 카드를 게임 타입에 맞게 나눠줌
* run() - 플레이어를 추가해주고 카드가 부족할때까지 게임을 진행함

출력화면

<img width="410" alt="스크린샷 2020-02-10 오전 11 27 48" src="https://user-images.githubusercontent.com/50410213/74117339-afb4f280-4bfa-11ea-8e44-de6606413077.png">

출력을 위한 임시 코드
```swift
func run() {
    addPlayers()
    print("\(gameType)카드 기준, 참가자 \(numberOfPlayers)명 일 때\n")
    while resumable {
        play()
        var index = 1
        players.forEach {
            if index <= numberOfPlayers {
                    print("참가자#\(index) \($0.hand)")
            } else {
                print("딜러 \($0.hand)")
            }
            index += 1
        }
    }
}
```

#### 6 - 2. 테스트

Dealer 테스트 코드
```swift
@testable import CardGameApp
import XCTest

class DealerTest: XCTestCase {

    var dealer: Dealer!
    
    override func setUp() {
        super.setUp()
        dealer = Dealer()
    }
    
    func testDrawCard() {
        XCTAssertEqual(dealer.deck.count, 52)
        dealer.drawCard()
        XCTAssertEqual(dealer.deck.count, 51)
        XCTAssertNotNil(dealer.drawnCard)
    }
}
```
* 카드를 뽑은 후 덱에서 카드가 잘 뽑혔는지, 딜러가 카드를 잘 들고 있는지 확인해줌

PokerGame 테스트 코드
```swift
@testable import CardGameApp
import XCTest

class PokerGameTest: XCTestCase {

    var fiveCardStud: PokerGame!
    var sevenCardStud: PokerGame!
    
    override func setUp() {
        super.setUp()
        fiveCardStud = PokerGame(gameType: .fiveCardStud, numberOfPlayers: 2)
        sevenCardStud = PokerGame(gameType: .sevenCardStud, numberOfPlayers: 3)
        
    }
    
    func testAddPlayers() {
        fiveCardStud.addPlayers()
        XCTAssertEqual(fiveCardStud.players.count, 3)
        sevenCardStud.addPlayers()
        XCTAssertEqual(sevenCardStud.players.count, 4)
    }
    
    func testDistributeCards() {
        fiveCardStud.addPlayers()
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 1)
        }
    }
    
    func testInitHand() {
        fiveCardStud.addPlayers()
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 1)
        }
        fiveCardStud.initHand()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 0)
        }

    }
    
    func testGame() {
        fiveCardStud.run()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 5)
        }
        XCTAssertLessThan(fiveCardStud.dealer.deck.count, (fiveCardStud.players.count) * fiveCardStud.gameType.rawValue)
        sevenCardStud.run()
        sevenCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 7)
        }
        XCTAssertLessThan(sevenCardStud.dealer.deck.count, (sevenCardStud.players.count) * sevenCardStud.gameType.rawValue)
    }
}
```
* 테스트 코드를 한 기능만 테스트하도록 하고 싶었지만 카드를 나눠주는건 플레이어가 있어야만 가능하고 핸드를 초기화하는건 플레이어의 손에 카드가 있어야 가능해서 한 기능만 테스트 할 수가 없었음.