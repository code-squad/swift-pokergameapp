# LENA의 Poker Game App

# Poker Game App 

## 목차

- [pokergameapp-step1](#pokergameapp-step1): StackView를 통해 동일한 비율의 7개 카드(뒷면)가 동일한 간격으로 수평으로 나열 
- [pockerGameApp-step2](#pockerGameApp-step2): Card 클래스 구현
- [pockerGameApp-step3](#pockerGameApp-step3): CardDeck 클래스 구현


### pokergameapp-step1
02.08 23:30


1. 코드로 StatusBar 스타일을 LightContent로 변경

  ```swift
   override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
   }
  ```

  ![](https://i.imgur.com/nP2o4mY.png)
  (왼쪽 스냅샷 : 설정 전, 오른쪽 스냅샷 : 설정 후)

2. view 배경에 들어갈 패턴 이미지를 Assets에 추가 후, 패턴 이미지 적용
![](https://i.imgur.com/hwgvBE0.png)

3. 카드 뒷면 이미지 Assets에 추가

02.09 20:50

![image-20200209190050604](/Users/keunnalee/Library/Application Support/typora-user-images/image-20200209190050604.png)

4. ViewController 클래스에서 코드로 화면을 균등하게 7등분해서 7개 UIImageView를 추가
   : 뷰를 7개 만들어서 Auto Layout으로 직접 하나하나 제약을 설정하는 방법 외에 다른 방법을 찾다가 UIStackView를 알게되서 StackView를 사용해서 구현.
- 4-1 StackView 생성
  : StackView.translatesAutoresizingMaskIntoConstraints = false로 설정 변경.
  axis(배치 방향 설정하는 속성)을 수평으로 설정.
  distribution(Axis와 동일한 축에서 subView의 크기와 배치방식 설정하는 속성)을 Fill Equally로 설정.
  spacing(수평/수직 간격 설정하는 속성) 설정.
- 4-2 card 생성 
: 가로 세로 비율을 1:1.27로 설정.
  비율을 유지하도록 Content Mode를 scaleAspectFit로 설정.
- 4-3 7개의 card를 만들어 StackView에 추가 
- 4-4 StackView 제약 설정

5. RootView에 Subview로 StackView 추가 

1. AutoLayout이 어떤 레이아웃 시스템이고 어떤 맥락에서 생겼는지 알게 됐습니다.

2. AutoLayout에서 제약을 추가할 때 필요한 키워드(multiplier, first item, second item, safe area 등)를 알게 됐습니다.

3. StackView관련 메소드와 StackView에 제약을 주는 키워드(axis,distribution,spacing,alignment)를 알게 됐고 써봤습니다.

### pockerGameApp-step2
02.10 21:00

0. testCode 작성
![](https://i.imgur.com/E5x9EX6.png)

1. Card class 생성

2. Suit enum 생성

3. Rank enum 생성

4. enum을 선택한 이유
**4-1.** 카드의 Rank와 Suit는 이미 정해져 있고(추후 수정되거나 추가되지 않기 때문에) 각각 같은 한 타입이기 때문에 배열이나 딕셔너리가 아닌 enum을 선택했습니다.
**4-2.** 사실 지금 메모리를 고려하는게 맞는지 모르겠지만 클래스 같은 경우에는 인스턴스 생성 후 인스턴스를 해지하지 않으면 메모리에 계속 남아있지만 enum은 사용을 다하면 자동으로 스택에서 사라지기 때문에 enum이 더 낫다고 생각했습니다.
**4-3.** 프로퍼티를 호출할 때 클래스에서는 프로퍼티를 호출할 때 마다 "Suit().hearts" 이런 식으로 명시해줘야 하지만 enum은 추론 가능할 때 ".eight"과 같이 표현할 수 있어서 더 편하다고 생각했습니다.

5. Card Class 프로퍼티와 init 메소드 추가 

6. 카드 정보를 출력하기 위한 문자열을 반환하는 메소드 구현

7. ViewController에 카드 정보를 출력하는 메소드 구현

   ![image-20200210212217610](/Users/keunnalee/Library/Application Support/typora-user-images/image-20200210212217610.png)

20.02.11 피드백 반영 후 수정한 사항

1. Card 클래스가 CustomStringConvertible프로토콜을 채택한 후 프로퍼티 추가.

   ```swift
    class Card: CustomStringConvertible {
       
       let suit : Suit.RawValue
       let rank : Rank.RawValue
       var description: String {
           return "\(suit)\(rank)"
       }
       
       init(suit: Suit, rank: Rank) {
           self.suit = suit.rawValue
           self.rank = rank.rawValue
       }
    }
   ```

   

2. ViewController 클래스에서 makeCard 메소드와 setCard 메소드를 합쳤습니다.

3. ViewController 클래스에서 StackView를 초기화하는 코드를 메소드로 따로 분리해서 구현했습니다.

4. ViewController 클래스의 addCard메소드 실행시 StackView의 subView가 7개가 생성되는지 확인하는 테스트 코드를 추가했습니다. -> (ViewController 테스트 코드는 Unit Test 보다 UITest를 하는 편이라는 걸 알게됐습니다.)

### pockerGameApp-step3

20.02.11 18:00

1. 테스트 코드 작성
1-1. CardDeck 구조체의 reset 메소드를 테스트하는 코드
1-2. CardDeck 구조체의 shuffle 메소드를 테스트하는 코드
1-3. CardDeck 구조체의 removeOne 메소드를 테스트하는 코드
1-4. CardDeck 구조체의 count 메소드를 테스트하는 코드

RGR(red, green, refactor) & BDD(given, when, then) 시도
2. 테스트 코드가 에러가 나는 상태(Red)에서 Red를 없애면서 구현
2-1. 테스트 코드에서 XCTAssertEqual 메소드나 XCTAssertNotEqual 메소드를 사용하기 위해 CardDeck 구조체와 Card 클래스에 extension으로 Equatable 프로토콜을 채택 
2-1. Suit enum과 Rank enum이 CaseIterable 프로토콜 채택
2-2. CaseIterable 프로토콜의 메소드인 allCases를 활용해 CardDeck 구조체에서 reset 메소드 구현

20.02.12 16: 15

3. 처음처럼 모든 카드를 다시 채워넣는 reset메소드 구현. 

4. 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제하는  removeOne 메소드 구현

3 & 4. CardDeck 구조체가 가지고있는 프로퍼티 cards를 변경하는 메소드(reset, removeOne) 구현하다가 self(CardDeck 구조체)가 immutable하기 때문에 reset, removeOne 메소드 이름 앞에 mutating 키워드를 추가해 변경 가능하도록 바꿨습니다.

5. 전체 카드를 랜덤하게 섞는 Shuffle 메소드 구현

셔플 알고리즘에 대해서 공부했습니다.

5-1. Fisher–Yates shuffle algorithm (original)

```swift
var items = ["A", "B", "C", "D", "E", "F", "G", "H"]
var shuffled = [String]();

for i in 0..<items.count
{
    let rand = Int(arc4random_uniform(UInt32(items.count)))

    shuffled.append(items[rand])

    items.remove(at: rand)
}

print(shuffled)
```
5-2. Knuth Shuffle: Fisher–Yates shuffle algorithm (modern)
https://developer.apple.com/videos/play/wwdc2018/406/?time=1289
(Fisher–Yates shuffle: 23:05 ~ )
애플의 shuffle 메소드는 이 방식으로 구현됐습니다.

```swift
var items = ["A", "B", "C", "D", "E", "F", "G", "H"]
var last = items.count - 1

while(last > 0)
{
    let rand = Int(arc4random_uniform(UInt32(last)))

    print("swap items[\(last)] = \(items[last]) with items[\(rand)] = \(items[rand])")

    items.swapAt(last, rand)

    print(items)

    last -= 1
}
```
original과 달리 두 개의 Collection이 필요없습니다.
5-3. navie shuffle algorithm vs Fisher–Yates shuffle
https://dyladan.me/abc/2016/01/20/shuffle/
https://gist.github.com/robertmryan/b002b7d524646fd677bb3979c89ec331 

```swift
extension Array {
    
    /// Simple implementation of Fisher-Yates
    
    mutating func shuffle() {
        for i in 0 ..< count - 1 {
            let j = i + Int(arc4random_uniform(UInt32(count - i)))
            swapAt(i, j)
        }
    }
    
    /// Naive implementation that introduces biases
    
    mutating func shuffleBiased() {
        for i in 0 ..< count {
            let j = Int(arc4random_uniform(UInt32(count)))
            swapAt(i, j)
        }
    }
}
```
navie shuffle은 편향된 셔플 결과를 보이는 반면 Fisher-Yates shuffle은 항상 비슷한 셔플 결과를 보입니다.

- shuffle()과 shuffled() 공통점과 차이점
  * 공통점 : Collection의 value들을 섞습니다., 복잡도가 O(n)입니다.
  * 차이점: shuffled 메소드는 셔플한 Collection을 반환합니다.

6. 갖고 있는 카드 개수를 반환하는 Count 메소드 구현

- count 갖고 있는 카드 개수를 반환합니다.
- shuffle 기능은 전체 카드를 랜덤하게 섞습니다.
- removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제합니다.
- reset 처음처럼 모든 카드를 다시 채워넣습니다.

7. 테스트 코드에서 Card 객체 비교시 Thread가 끊임없이 돌아갔습니다 -> Card 클래스의 Equatable 비교 대상을 수정했습니다.