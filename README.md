# Cri
# PokerGameApp

## 1단계 (2021.02.15 22:35)

UIImageView는 UIView로부터 상속받은 클래스로, 크기 조정 등 관련 프로퍼티는 UIView에서 확인했습니다.

다음 화면처럼 프로젝트 설정에서 Status Bar Style을 LightContent로 변경할 수 있었습니다.

![스크린샷 2021-02-15 오후 2 46 09](https://user-images.githubusercontent.com/61342175/107933337-f84b7c80-6fc1-11eb-8580-c50e7cf0ab3a.png)

프로젝트 생성 시 info.plist에서 바로 Status Bar Style을 찾을 수 없었습니다.

![스크린샷 2021-02-15 오후 6 27 03](https://user-images.githubusercontent.com/61342175/107933609-4bbdca80-6fc2-11eb-919b-0f20e2141402.png)

변경을 한 번 했을 때 다음처럼 info.plist에도 보였습니다.

![스크린샷 2021-02-15 오후 5 23 04](https://user-images.githubusercontent.com/61342175/107933670-6728d580-6fc2-11eb-86e3-5b1150ef99be.png)

Assets.xcassets에 이미지를 추가하고 override func viewDidLoad에 아래 코드를 추가함으로써 배경을 변경했습니다.

```
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
```

7장의 카드는 아래 코드를 override func viewDidLoad에 추가해서 구현했습니다.


```
let VCWidth = self.view.frame.maxX

for i in 0..<7 {
    
    let cardOriginImage = "card-back.png"
    let cardUIImage = UIImage(named: cardOriginImage)
    let cardUIImageView = UIImageView(image: cardUIImage!)
    
    let cardWidth = VCWidth / 8
    let cardHeight = cardWidth * 1.27
    let cardToCard = cardWidth / 8
    
    cardUIImageView.frame.size.width = cardWidth
    cardUIImageView.frame.size.height = cardHeight
    
    cardUIImageView.center = CGPoint(x: cardToCard + cardWidth / 2 + CGFloat(i) * (cardWidth + cardToCard), y: 100)
    view.addSubview(cardUIImageView)
    
}
```

시뮬레이터 모습은 아래와 같습니다.

![Simulator Screen Shot - iPhone 12 Pro - 2021-02-15 at 19 12 48](https://user-images.githubusercontent.com/61342175/107951625-fbebfd00-6fdb-11eb-8da5-b6b3c4e0ffaf.png){: width="50%" height="50%"}

## 2단계 (2021.02.15 22:35)

마침 주말에 CS10 과정 동안 부족했던 부분을 학습하기 위해 객체지향을 주제로 글을 썼습니다. 내용은 아래와 같습니다.

>이 글은 '객체지향의 사실과 오해'라는 책을 읽고 참고하면서 작성한 글입니다.
>
>## 객체와 자율성
>
>"객체는 상태와 행동을 지닌 것이다. 또한, 객체는 고유의 역할과 책임을 지니고 있다. 객체는 다른 객체와 메시지를 주고 받으며 상호협력한다."
>
>책의 첫 부분에서 객체를 설명하기 위해 카페에 비유한 설명이 있다. 카페에서 일을 해본 것은 아니지만 평소 커피를 좋아하기 때문에 친근한 예시였다. 카페에 들어섰을 때 나타나는 이미지를 연상하면, 고객은 주문을 받는 사람에게 주문을 한다. 주문을 받은 사람은 바리스타에게 들어온 주문을 알려준다. 아주 단순한 단계로 요약해도 서로 메시지를 주고 받고 있다. 고객은 주문을 받는 사람에게, 주문을 받는 사람은 바리스타에게 메시지를 전달한다.
>
>"아이스 아메리카노 주문할게요."
>
>"아이스 아메리카노 주문 들어왔어요."
>
>그런데 주문을 받는 사람이 바리스타에게 다음과 같이 메시지를 전달한다고 생각해보자.
>
>"우리 매장에 라마르조꼬 리네아 3그룹 머신 있는거 아시죠?ㅎㅎ EK43 그라인더 분쇄도 1.5로 맞춰서 그라인딩 하시고 원두 파우더를 포타필터에 담아서 탬핑 안 하고 디스트리뷰터만 사용한 뒤에 라마르조꼬 리네아 머신 두 번째 그룹헤드에서 추출한 에스프레소를 얼음 12개 담긴 컵에 에스프레소를 넣고 물은 280g 희석한 아이스 아메리카노 만들어 주세요.ㅎㅎ"
>
>돌아오는 바리스타의 답변을 예상해보자.
>
>"사사건건 일해라 절해라 하실거면 니가 하세요.ㅎㅎ"
>
>객체는 스스로 책임과 역할을 지닌다고 했다. 그런데 지나치게 범위를 넘어선 객체가 있다면, 특정 객체는 존재의 의미가 없어진다. 정의할 필요조차 없었을지도 모른다. 주문을 받는 사람은 주어진 역할과 책임(주문을 받는 것)에만 충실해야 하며, 전달해야 하는 메시지는 주문이 들어왔다는 메시지이다. 주문을 전달했을 때 바리스타는 스스로 지닌 책임과 역할에 따라 맡은 바를 수행하되, 자율성을 갖고 스스로 행동해야 한다.그런데 왜 하나의 객체가 여러 가지 역할과 책임을 지니는 것이 좋지 않은지가 궁금할 수 있다. 만약 누군가가 에스프레소 추출이라는 행동에 접근해야 하는 상황이라고 가정해보자. 분명 바리스타가 그 역할과 책임에 따라 에스프레소 추출이라는 행동을 지니고 있을 것으로 기대된다.
>
>그런데 주문을 받는 사람이 에스프레소 추출이라는 행동을 지니고 있었다면, 그 행동에 접근하려는 사람은 행동에 접근하려고 할 때 시간이라는 비용이 생길 것이다. 또한, 애초에 역할과 책임을 할당할 때도 누구에게 그 역할과 책임을 맡겨야 하는지에 대해 고민하는 시간이 줄어든다. 다르게 표현하면 변경과 설계에 유연하게 대처할 수 있다는 것이다. 그렇다면 자율성은 어떻게 보장받을 수 있는지 생각해볼 수도 있다. 외부로부터 구현을 감추기 위해 객체를 캡슐화 할 수 있다. Swift에서 public, private을 떠올릴 수 있다. public은 외부에서 활용할 수 있는 것으로 정의하게 되며, private은 외부로부터 접근이 제한되는 객체 고유의 무엇으로 정의할 수 있게 해준다.
>
>## 도메인 모델
>
>책을 읽으면서 놓치지 않아야겠다는 생각이 들었던 부분이 있다. 식품 기업에서 마케팅 리서치 실무를 겪으면서 느꼈던 바와 관련이 있다. 많은 조사설계와 실사, 설문 데이터 분석을 하면서 느낀 부분인데, 특정 카테고리 제품에 대해 소비자는 '기대하는 것'이 있다. 흔히 마케터나 마케팅 리서처가 실수할 수 있는 부분은 소비자가 기대하는 기본적인 특성을 무시하고 부가적인 기능을 강조하는 마케팅 커뮤니케이션을 하려는 것이다. 일단 소비자가 기본적으로 기대하고 있는 것을 충족시킬 수 있으면서 동시에 부가적인 것을 소개할 수 있어야 한다. 그렇지 않으면 소비자가 식품 섭취를 통해 기대할 수 있는 것을 충족시킬 수 없다고 판단한다. 이런 경우 기업, 마케터, 마케팅 리서처는 소비자가 기대하는 것을 충족시키지 못하고 있는 것이다. 제품 개발 과정에서 자주 느꼈던 상황이다. 애플리케이션도 마찬가지다. 사용자는 특정 애플리케이션을 사용하면서 얻을 수 있는 고유의 효과를 기대할 것이다. 개발자는 그에 걸맞는 프로그래밍을 해야 한다. 사업 관점이자 제품 관점이기도 하다.
>
>다시 객체지향으로 넘어오자.
>
>"객체지향을 사용하면 사용자들이 이해하고 있는 도메인의 구조와 최대한 유사하게 코드를 구조화할 수 있다. (중략) 객체지향 패러다임은 사용자의 관점, 설계자의 관점, 코드의 모습을 유사한 형태로 유지할 수 있게 하는 유용한 사고 도구와 프로그래밍 기법을 제공한다. 결과적으로 객체지향을 이용하면 도메인에 대한 사용자 모델, 디자인 모델, 시스템 이미지 모두가 유사한 모습을 유지하도록 만드는 것이 가능하다."
>
>다음 문장도 눈에 띈다.
>
>"요구사항들을 식별하고 도메인 모델을 생성한 후, 소프트웨어 클래스에 메서드들을 추가하고, 요구사항을 충족시키기 위해 객체들 간의 메시지 전송을 정의하라[Larman 2001]."
>
>1. 요구사항들을 식별하고(사용자가 기대하는 바가 무엇인지 파악하고)
>2. 도메인 모델을 생성한 후(안정적인 구조를 생성한 후)
>3. 객체들 간의 메시지 전송을 정의
>
>궁극적으로 얻을 수 있는 이점을 생각하면, 사용자의 기대하는 바가 바뀌어 기능이 변경되거나 추가된다고 해도 전체적인 구조가 안정적이다. 특정 기능의 변경에 대한 예시만 생각해봐도 구조는 유지된 채로 해당 기능을 찾아 재정의하면 그만이다.

swift 파일을 프로젝트에 추가하고 card 클래스를 만들었습니다. 클래스 밖에 카드가 가질 수 있는 값을 담은 구조체를 구현하고 값을 설정했습니다. 클래스 내에는 서로 다른 카드 52장으로 이뤄진 카드 한 묶음을 생성하는 함수를 추가했습니다. 빈 배열을 만들어놓고 함수를 통해 52장의 카드를 추가했습니다. 동시에 배열, 즉 카드 한 묶음에서 랜덤하게 한 장을 뽑는 코드를 구현했습니다. 아래는 viewDidLoad에 카드 클래스의 함수를 넣었을 때 콘솔 결과입니다.

![스크린샷 2021-02-15 오후 9 45 49](https://user-images.githubusercontent.com/61342175/107951790-36559a00-6fdc-11eb-9ba8-e0d354b35bdb.png)

카드 한 묶음을 생성하고 랜덤 카드 한 장을 뽑아 출력했습니다.

## 1, 2단계 수정사항 (2021.02.16 16:35)

1. 프로젝트 생성 시 자동으로 생성되는 주석을 삭제했습니다. (그냥 삭제만 하는 것이 아니라 내용도 살펴봤어야 했는지 생각이 들어서 어떤 내용이 있는지 추후에 확인해보려고 합니다.)
2. Card와 관련된 구조체와 클래스의 이름을 각각 Card, CardDeck으로 변경했습니다. 수업 중 말씀해주신 내용이 떠올라 이름을 블록으로 두고 우클릭, Refactor, Rename을 사용해봤습니다.
3. CustomStringConvertible을 사용해 열거형의 rawValue를 직접 사용하지 않도록 구현해봤습니다. 익숙하지 않아 혼자 여러 시도를 했지만 어려웠고 다른 코드를 참고했습니다. 앞으로 더 많이 사용해봐야 할 것 같습니다.
4. if let을 통해 옵셔널 강제 언래핑을 옵셔널 바인딩으로 수정했습니다.
5. VCWidth를 viewController로 수정했습니다.
6. 이미지뷰 생성을 위한 for 구문 안에 있었던 반복이 필요없는 상수 선언을 for 구문 밖으로 이동시켰습니다.
7. 이미지뷰 생성을 위한 for 구문 중 이미지 포지션 x가 길었던 것을 더 짧게 만들기 위해 첫 번째 카드의 x 포지션을 따로 선언해서 작성했습니다.
8. 프로젝트 생성 후 자동으로 생성된 테스트를 삭제했습니다. Xcode 업데이트 이후 자동으로 생성되는 것인지, 옵션에 따라 생성하지 않을 수도 있는지 알아봐야 할 것 같습니다.
9. 현재 Cri_PokerGameApp_Step3 브랜치를 생성 후 작업하고 있습니다.

## 3단계 (2021.02.16 16:35)

CardPlaying 파일을 별도로 만들어 CardPlaying 클래스에 함수를 구현해 deck shuffle, deck reset 등을 구현했습니다. 콘솔에 작동하는 모습을 남겼습니다. 아래 이미지와 같습니다.

![스크린샷 2021-02-16 오후 4 33 10](https://user-images.githubusercontent.com/61342175/108032002-1cb46100-7075-11eb-9862-43d6cbce23c5.png)

### Struct와 Class

Link   
<https://jusung.gitbook.io/the-swift-language-guide/language-guide/09-classes-and-strucutres>   
<https://medium.com/@cenker.demir/call-by-reference-vs-call-by-value-using-swift-pre-swift3-1c822c80819a>
<https://stackoverflow.com/questions/24232799/why-choose-struct-over-class/24232845>

공통점
- 프로퍼티, 메소드를 가질 수 있음
- subscript를 통한 값 접근이 가능하도록 subscript 정의
- initializer 정의
- 기능 확장(extension?)
- 정의한 프로토콜 순응

클래스만 가능한 부분
- 상속
- 타입 캐스팅
- 인스턴스 소멸
- 클래스 인스턴스로 참조 가능

### Fisher-Yates shuffle

"모든 원소를 담아둔 상태에서 원소가 남아있지 않을 때까지 하나씩 차례로 뽑는 알고리즘?"

1. Pencil-and-paper method
- [1, 2, 3, 4, 5, 6, 7, 8] / result array
- roll random number between 1 to 8
- if 3, third element moves to result array
- [1, 2, 4, 5, 6, 7, 8], [3]
- roll random number between 1 to 7
- if 4, fourth element moves to result array
- [1, 2, 4, 5, 6, 7, 8], [3, 5]
- iteration until all elements move

2. Modern method

- [1, 2, 3, 4, 5, 6, 7, 8] / result array
- roll random number between 1 to 8
- if 3, third element moves to result array and last element moves to third element index
- iteration until all elements move

### 메모리 누수를 감지할 수 있는 세 가지 방법

Link
<https://medium.com/@iostechset/3-ways-to-detect-memory-leaks-in-ios-bdf9425507d6>

- FBRetainCycleDetector
- Debug Memory Graph
- Allocations and Leaks Instrument

구현하면서 한 번씩 활용해봐야겠습니다.

### Type Property를 활용하는 경우 (2021.02.16 19:22)

Link   
<https://sujinnaljin.medium.com/swift-static과-class-method-property-효과적으로-사용하기-b336311a923c>

1. Configuration
2. Expensive Object
3. Creation of simple factory

다른 타입과 연결하려는 경우 유용..

아직 잘 이해가 되지 않아 더 많은 글을 살펴봐야 할 것 같습니다.

# 추가적으로 알아볼 부분 (2021.02.16 16:35)

예전부터 궁금했었던 것입니다. 구조체는 값의 복사로 인해 메모리 별도 위치에 값이 할당되는 것이기 때문에 상대적으로 메모리 효율이 떨어지는 것이 아닐까 생각했습니다. 클래스는 참조이므로 메모리에 할당된 주소 한 곳만을 바라보기 때문에 별도 메모리 위치에 값을 할당할 필요가 없어 상대적으로 메모리 효율이 좋은 것이 아닌지 생각했었습니다. Struct와 Class 내용의 두 번째 링크가 관련이 있는 것 같은데, 정확하게 이해하고 있는 것인지 모르겠습니다. 세 번째 링크는 WWDC 2015의 script 내용을 볼 수 있는데, 구조체가 '메모리 누수', '하나의 변수 인스턴스에 접근, 수정이 일어날 때 발생할 수 있는 멀티스레드 racing'에서 더 이점을 갖고 있다고 하는 것 같습니다. 앞서 설명한 메모리 효율과 다른 내용으로 이해하고 있는데, 메모리 누수와 관련한 내용으로는 상대적으로 구조체가 더 쉽고 확실하게 메모리에서 지워질 수 있는 특성이 있는 것이 아닐까 생각하고 있습니다.

중간에 시스템 리소스에 대해서 찾아보기도 했는데, 단순히 메모리만을 생각할 것이 아니라 CPU 속도에 대한 내용이 언급되어 있어 시스템 리소스에 대한 개념을 다시 정리해야 할 필요성을 느꼈습니다.
