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
    
    func getInfo() -> String {
        var info = shape.rawValue
        switch rank {
        case .A, .J, .Q, .K:
            info += "\(rank)"
        default:
            info += "\(rank.rawValue)"
        }
        return info
    }
}
```
<img width="470" alt="스크린샷 2020-02-07 오후 5 09 17" src="https://user-images.githubusercontent.com/50410213/74012058-b52cf580-49cc-11ea-85dc-8ec158ab2d1f.png">
<img width="273" alt="스크린샷 2020-02-07 오후 5 09 07" src="https://user-images.githubusercontent.com/50410213/74012053-b3fbc880-49cc-11ea-9cfb-187f702e138c.png">

