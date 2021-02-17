# Poker Game App

2021년 2월 15일 (월)
포커게임 앱 저장소


## STEP 1

- StatusBar LightContent 로 바꾸기
- ViewController 에서 이미지 패턴을 view 배경으로 지정하기
- 7등분 균등한 카드 뒷면 UIImageView 를 추가한다

"아이폰 12 pro     vs     아이패드"

<img src = "https://user-images.githubusercontent.com/73650994/107914474-dcd27880-6fa5-11eb-94ec-f52d886ab335.png" width = "250">         <img src = "https://user-images.githubusercontent.com/73650994/107914461-d512d400-6fa5-11eb-927b-ac9cfa1c336d.png" width = "350">

- 추가 구현 : 카드 모서리를 둥글게 만들어봤다

### view 와 stackView 제약 조건을 학습함

```swift
let cardStackView = UIStackView(arrangedSubviews: cards)
        cardStackView.axis = .horizontal
        cardStackView.alignment = .fill
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 5
        
        self.view.addSubview(cardStackView)
        cardStackView.translatesAutoresizingMaskIntoConstraints = false

        cardStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        cardStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true

```

- 주의 사항

- > UIImageView 는 클래스라서 Array(repeating: count:) 로 복사하려고 할 시, 하나만 들어가게 된다 😱





## STEP 2

- 카드 모양 :  raw value 를 가진 enum
- 카드 숫자 :  Dictionary -> raw value 를 가진 enum 

- 카드 클래스에 CustomStringConvertible 을 적용해서 출력 함수 없이, 출력 형식을 지정함







## STEP 3

- 카드덱 클래스 구현
  - init()
  - countCard() → Int
  - shuffle()
  - takeOutCard() → Card
  - reset()
  - showCardDeck() → [Card]
- 카드덱 테스트 구조체 구현
  - count, shuffle, takeOutOne, reset 을 테스트함

<img width="400" alt="스크린샷 2021-02-17 오후 4 15 51" src="https://user-images.githubusercontent.com/73650994/108169979-d6c2d000-713c-11eb-8528-02010105525c.png">

