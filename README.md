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
    private var hand = [Card]()
    var handCount: Int {
        hand.count
    }
    var handInfo: [Card] {
        return hand
    }
    
    func discard() {
        hand = [Card]()
    }
    
    func receive(_ card: Card) {
        hand.append(card)
    }
}
```
* hand 를 private 으로 설정해주고 handInfo 와 handCount 를 통해서 읽기만 가능하도록 해줌
* 게임 재시작을 위해 핸드의 기존 카드를 버려주는 discard
* 딜러에게서 카드를 받아 핸드에 추가하기위한 receive

2. Dealer 클래스
```swift
class Dealer: Player {
    private var deck = Deck()
    var deckCount: Int {
        deck.count
    }
    
    func drawCard() -> Card? {
        return deck.removeOne()
    }
    
    func shuffle() {
        deck.shuffle()
    }
}
```
* 딜러도 게임에 참여하기 때문에 Player 클래스를 상속받게 해줌
* 딜러가 플레이어들에게 카드를 나눠줘야 하므로 Deck 을 딜러에게 줌
* deck 에도 private 을 설정해줘서 직접 접근을 불가능하게 함
* 덱에서 카드를 뽑아서 drawnCard 에 담는 drawCard()
* 덱을 섞어주는 shuffle()

3. PokerGame 클래스
```swift
class PokerGame {
    enum GameType: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    enum NumberOfPlayers: Int {
        case two = 2
        case three = 3
        case four = 4
    }
    private var dealer: Dealer
    var players = [Player]()
    private var gameType: GameType
    private var resumable: Bool {
        dealer.deckCount > (players.count) * gameType.rawValue
    }
    
    init(gameType: GameType, numberOfPlayers: NumberOfPlayers) {
        self.gameType = gameType
        self.dealer = Dealer()
        for _ in 1...numberOfPlayers.rawValue {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    func distributeCards() {
        players.forEach {
            guard let drawnCard = dealer.drawCard() else {
                return
            }
            $0.receive(drawnCard)
        }
    }
        
    func play() {
        while resumable {
            players.forEach {
                $0.discard()
            }
            dealer.shuffle()
            for _ in 1...gameType.rawValue {
                distributeCards()
            }
        }
    }
}
```
* 딜러 한명과 플레이어들을 담을 배열 players
* 게임 참여 인원수 numberOfPlayers, 7카드스터드와 5카드스터드 구분을 위한 gameType
* numberOfPlayers 와 gameType 은 enum 으로 만들어 선택지를 제한해줌
* PokerGame 을 생성할 때 참여인원수와 게임타입을 정해줌
* 게임을 생성 할 때 입력받은 참여자 수 만큼 플레이어를 추가해줌
* distributeCards() - 딜러가 카드를 한장씩 뽑아 플레이어들에게 나눠줌
* play() - 플레이어들의 손패의 기존 카드를 버린 후 덱을 섞어주고 카드를 게임 타입에 맞게 나눠줌

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
        XCTAssertEqual(dealer.deckCount, 52)
        dealer.drawCard()
        XCTAssertEqual(dealer.deckCount, 51)
    }
}
```
* 카드를 뽑은 후 덱에서 카드가 잘 뽑혔는지 확인해줌

PokerGame 테스트 코드
```swift
@testable import CardGameApp
import XCTest

class PokerGameTest: XCTestCase {

    var fiveCardStud: PokerGame!
    var sevenCardStud: PokerGame!
    
    override func setUp() {
        super.setUp()
        fiveCardStud = PokerGame(gameType: .fiveCardStud, numberOfPlayers: .two)
        sevenCardStud = PokerGame(gameType: .sevenCardStud, numberOfPlayers: .three)
    }
    
    func testAddPlayers() {
        XCTAssertEqual(fiveCardStud.players.count, 3)
    }
    
    func testDistributeCards() {
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 1)
        }
    }
    
    func testFiveCardStud() {
        fiveCardStud.play()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 5)
        }
    }
    
    func testSevenCardStud() {
        sevenCardStud.play()
        sevenCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 7)
        }
    }
}
```
* 생성 후 플레이어가 잘 추가되었는지, 카드를 잘 나눠주는지, 카드 갯수를 게임 타입에 맞게 잘 나눠주는지 확인해줌.


#### 7. 카드게임 앱

```swift
class ViewController: UIViewController {

    var gameType: PokerGame.GameType = .sevenCardStud
    var numberOfPlayers: PokerGame.NumberOfPlayers = .two
    var pokerGame: PokerGame!
    
    var gameTypeControl: UISegmentedControl!
    var numberOfPlayersControl: UISegmentedControl!
    
    var gameTable: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 30
        return stack
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        addGameTypeControl()
        addNumberOfPlayersControl()
        loadGame()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        loadGame()
    }
    
    func resetGameTable() {
        gameTable.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func loadGame() {
        pokerGame = PokerGame(gameType: gameType, numberOfPlayers: numberOfPlayers)
        resetGameTable()
        pokerGame.play()
        makeGame()
        setGameTableLayout()
        self.view.layoutIfNeeded()
    }
    
    func makeSegments(items: [String]) -> UISegmentedControl {
        let segments = UISegmentedControl(items: items)
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        segments.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segments.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))], for: .selected)
        return segments
    }
    
    func addGameTypeControl() {
        gameTypeControl = makeSegments(items: ["7 Card", "5 Card"])
        view.addSubview(gameTypeControl)
        gameTypeControl.addTarget(self, action: #selector(gameTypeChanged(segControl:)), for: .valueChanged)
        gameTypeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func gameTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            gameType = .sevenCardStud
            loadGame()
        case 1:
            gameType = .fiveCardStud
            loadGame()
        default:
            break
        }
    }
    
    func addNumberOfPlayersControl() {
        numberOfPlayersControl = makeSegments(items: ["2명", "3명", "4명"])
        view.addSubview(numberOfPlayersControl)
        numberOfPlayersControl.addTarget(self, action: #selector(numberOfPlayersChanged(segControl:)), for: .valueChanged)
        numberOfPlayersControl.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 10).isActive = true
        numberOfPlayersControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberOfPlayersControl.leadingAnchor.constraint(equalTo: gameTypeControl.leadingAnchor).isActive = true
        numberOfPlayersControl.trailingAnchor.constraint(equalTo: gameTypeControl.trailingAnchor).isActive = true
    }
    
    @objc func numberOfPlayersChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            numberOfPlayers = .two
            loadGame()
        case 1:
            numberOfPlayers = .three
            loadGame()
        case 2:
            numberOfPlayers = .four
            loadGame()
        default:
            break
        }
    }
    
    func makeGame() {
        var index = 1
        pokerGame.players.forEach {
            let playerLabel = makePlayerLabel(playerName: "Player\(index)")
            if index == pokerGame.players.count {
                playerLabel.text = "Dealer"
            }
            let playerCard = makePlayerCard($0)
            let playerStack: UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                return stack
            }()
            playerStack.addArrangedSubview(playerLabel)
            playerStack.addArrangedSubview(playerCard)
            gameTable.addArrangedSubview(playerStack)
            playerLabel.bottomAnchor.constraint(equalTo: playerCard.topAnchor).isActive = true
            index += 1
        }
        self.view.addSubview(gameTable)
    }
    
    func setGameTableLayout() {
        gameTable.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 50).isActive = true
        gameTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        gameTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func makePlayerLabel(playerName: String) -> UILabel {
        let playerLabel: UILabel = {
            let label = UILabel()
            label.text = playerName
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return playerLabel
    }
    
    func makePlayerCard(_ player: Player) -> UIStackView {
        let cardStack = makeCardStack()
        player.handInfo.forEach {
            let card = makeCard($0)
            cardStack.addArrangedSubview(card)
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
        }
        return cardStack
    }
    
    func makeCardStack() -> UIStackView {
        let cardStack: UIStackView = {
            let stack = UIStackView()
            stack.distribution = .fillEqually
            stack.spacing = -5
            return stack
        }()
        return cardStack
    }
    
    func makeCard(_ cardInfo: Card) -> UIImageView {
        let card: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 3.0
            imageView.clipsToBounds = true
            return imageView
        }()
        card.image = UIImage(named: "\(cardInfo).png")
        return card
    }
}
```

gameTable
* 먼저 플레이어의 핸드에 맞게 카드를 이미지뷰로 생성해줌 (makeCard)
* 카드들을 담을 스택뷰를 만들어줌 (makeCardStack)
* 만들어준 스택뷰에 만든 카드들을 담아줌 (makePlayerCard)
* makePlayerLabel 로 플레이어에 맞는 라벨을 만들어줌 (makeGame)
* 만들어준 라벨과 카드를 담은 스택뷰를 playerStack 에 담아줌
* 만든 스택을 gameTable 스택뷰에 담아줌 

SegmentedControl
* 먼저 gameTypeControl 을 makeSegments 로 만들어줌 (addGameTypeControl)
* 뷰에 만들어준 gameTypeControl 을 추가해준 뒤 위치를 잡아주고 target 을 추가해줌
* gameTypeControl 의 값이 변경되면 변경된 값에 맞게 게임타입을 바꿔준 뒤 게임을 다시 로드해줌 (gameTypeChanged)
* numberOfPlayersControl 의 추가도 같은 방식으로 동작함

실행
* 두 segmentedControl 을 추가해주고 loadGame 을 호출해줌
* loadGame 은 저장된 게임타입과 참가자 수로 pokerGame 을 초기화해주고 gameTable 스택뷰의 기존 뷰들을 지워준 뒤(resetGameTable) 게임을 실행하고(pokerGame.play) 게임의 결과에 맞게 gameTable 에 뷰를 추가해줌(makeGame) 그리고 gameTable 의 위치를 잡아주고(setGameTableLayout) view 를 다시 그려줌 (layoutIfNeeded)
* shake 이벤트 발생시 loadGame 을 호출해줌 (motionBegan)

##### 출력 결과
![스크린샷 2020-02-11 오후 9 41 02](https://user-images.githubusercontent.com/50410213/74237614-4c6cb280-4d17-11ea-8e94-b0f3022bb12a.png)
![스크린샷 2020-02-11 오후 9 41 07](https://user-images.githubusercontent.com/50410213/74237623-52fb2a00-4d17-11ea-878a-5481758ea7d2.png)
![스크린샷 2020-02-11 오후 9 41 11](https://user-images.githubusercontent.com/50410213/74237629-555d8400-4d17-11ea-835c-1ead83594e66.png)
![스크린샷 2020-02-11 오후 9 41 15](https://user-images.githubusercontent.com/50410213/74237634-58587480-4d17-11ea-916b-cb9af1e7b8f8.png)
