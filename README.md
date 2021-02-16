# 포커게임 앱 만들기

## Step.1

#### StatusBar 스타일을 LightContent로 변경
```swift
override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
```

- UIStatusBarStyle은 enum 타입으로 darkContent(default)와 lightContent가 있음
- 어두운 이미지를 배경으로 활용해야하기 때문에 LightContent로 statusBar 변경
- viewController에 preferredStatusBarStyle 함수를 override해서 ligthContent를 반환

#### 이미지 패턴으로 배경화면 설정
```swift
private func setUpBackGround () {
    self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
}
```

- 주어진 이미지를 xcassets에 추가
- 이미지를 패턴으로 활용하여 배경화면으로 설정하기 위하여 UIColor 활용
- image Literal을 활용하면 이미지를 직접 삽입 가능
- setUpBackGround 함수를 viewDidLoad에서 호출

#### 실행화면 (lightContent, darkContent, default)

<img src="https://user-images.githubusercontent.com/74946802/107917820-e19a2b00-6fab-11eb-916e-8f69a1c9d4b8.png" width="290" height="500"> <img src="https://user-images.githubusercontent.com/74946802/107918016-42c1fe80-6fac-11eb-8f9f-bbadd2e97004.png" width="290" height="500"> <img src="https://user-images.githubusercontent.com/74946802/107918016-42c1fe80-6fac-11eb-8f9f-bbadd2e97004.png" width="290" height="500">

#### 스택 뷰 추가
```swift
var stackView = UIStackView()
```
- UIStackView는 View를 한 세트로 만들어주는 역할
- 스택뷰를 활용하면 Horizontal, Vertical 위치의 이미지 처리 용이

```swift
private func setStackView() {
    self.view.addSubview(stackView)

    self.stackView.axis = .horizontal
    self.stackView.distribution = .fillEqually
    self.stackView.spacing = 4
    self.stackView.translatesAutoresizingMaskIntoConstraints = false

    self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
    self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
    self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
}
```

- view의 Subview로 stackView를 추가
- view.addSubview를 활용하면 view 위에(z축) image 출력
- axis를 horizontal로 선언하여 수평 stackView생성(수직의 경우 .vertical)
- spacing은 임의로 4로 지정

- translatesAutoresizingMaskIntoConstraints는 UIView의 인스턴스 프로퍼티  
  Autoresizing기능을 하며 true로 선언할 경우 view의 크기와 위치를 완전히 지정  
  추가적인 constrain을 추가할 수 없음  
  Auto-layout을 사용하여 view의 크기와 위치를 조절하려면 false로 선언  
  
- topAnchor은 위에서 부터, leadingAnchor은 앞에서 부터, trailingAnchor은 뒤에서 부터 spacing 조정
- bottomAnchor도 가능하지만, 해당 step에는 필요 없는 기능

#### 카드 배치 기능 추가
```swift
private func cardArrangement() -> UIImageView {
    let cardImage = UIImageView(image: #imageLiteral(resourceName: "card_back"))
    cardImage.contentMode = .scaleAspectFill
    cardImage.translatesAutoresizingMaskIntoConstraints = false
    cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
    return cardImage
}
```

- cardImage 상수를 선언하고 image Literal을 활용하여 xcassets에 있는 card 이미지 저장
- contentMode를 활용하여 비율을 유지하며 view의 사이즈에 맞게 이미지를 늘릴 수 있도록 지정
- stackView와 마찬가지로 Auto-layout 설정
- 가로와 세로의 비율을 1 : 1.27 설정, cardImage.widthAnchor로 부터 1.27배로 설정

#### 카드 이미지를 스택 뷰에 추가
```swift
private func addCardIntoStackView() {
    for _ in 0..<7 {
        self.stackView.addArrangedSubview(cardArrangement())
    }
}
```
- 7장의 카드를 추가해야 하기 때문에 for-loop 활용
- addArrangedSubview는 arrangedSubviews 배열의 끝에 view를 추가하는 메서드
- 파라미터로 입력 받은 view가 이미 stack view의 subview가 아닌 경우 stack view의 subview로 자동추가
- insertArrangedSubview를 활용하면 stack view 배열의 인덱스까지 설정 가능

#### 실행화면 (lightContent, darkContent, default)

<img src="https://user-images.githubusercontent.com/74946802/107921183-7fdcbf80-6fb1-11eb-8e61-4bb85f86c9db.png" width="290" height="500"> <img src="https://user-images.githubusercontent.com/74946802/107921281-a69af600-6fb1-11eb-88f3-84420df1b7b4.png" width="290" height="500"> <img src="https://user-images.githubusercontent.com/74946802/107921281-a69af600-6fb1-11eb-88f3-84420df1b7b4.png" width="290" height="500">

## Step.2

#### Card 클래스 및 enum 타입 생성
```swift
class Card {
    let suit: Suit
    let rank: Rank
    
    init(suit:Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    // 공통적인 타입을 가진 관련있는 값의 그룹을 묶기 위하여 enum타입을 활용
    enum Suit: Character {
        case spades = "♠️"
        case heart = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Rank: Int {
        case Ace = 1
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        case Ten
        case J
        case Q
        case K
    }
}
```
- card라는 class를 생성하고 그 안에 enum을 활용하여 카드의 정보를 입력
- enum은 공통적인 타입을 갖는 관련있는 값을 열거하기에 좋은 타입
- enum에 rawValue를 지정하기 위해서는 반드시 해당 타입으로 지정이 필요
- rawValue가 정수형인 경우 case별로 지정을 안해줘도 자동으로 +1씩 증가

#### 문자열을 반환하는 카드 정보 출력 함수 생성
```swift
func makeCardInfo () -> String {
    switch self.rank {
    case .Ace, .J, .Q, .K:
        return "\(suit.rawValue)\(rank)"
    default:
        return "\(suit.rawValue)\(rank.rawValue)"
    }
}
```
- Ace, J, Q, K의 경우 입력받은 suit의 rawValue와 rank를 반환
- 그 외의 경우에는 suit의 rawValue와 rank의 raVlue를 반환

#### viewController의 viewDidLoad에서 콘솔에 출력
```swift
override func viewDidLoad() {
    let heartQ = Card(suit: .heart, rank: .Q).makeCardInfo()
    let spadeSeven = Card(suit: .spades, rank: .Seven).makeCardInfo()
    print(heartQ)
    print(spadeSeven)
}
```
- 임의의 카드 하트Q, 스페이드7 콘솔에 출력

#### 출력화면

<img width="141" alt="스크린샷 2021-02-16 오전 11 47 04" src="https://user-images.githubusercontent.com/74946802/108013469-19a67a00-704f-11eb-8bfc-42ef3809dcc5.png">
test
