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