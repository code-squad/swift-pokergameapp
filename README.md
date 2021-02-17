# pokergameapp-step1, 2 - 게임판 만들기, 카드덱 구현과 테스트



- background 패턴 설정, card 7개 생성 후 stackView에 담아 구현 (programmatically)
- Card class를 만들고 card를 만들어 테스트 출력



완로 시각: 02/15 16:50



## 코드로 view를 생성하고 화면에 추가하는 방식

화면에 알맞게 표시하기 위해선 각 객체들의 크기와 위치를 애매한 부분 없이 작성해야 한다. 미션의 예를 들어서

1. #### imageView 만들 때 비율을 맞추고(aspect ratio)

   ```swift
   for _ in 1...7 {
       if let image = UIImage(named: "card-back.png") {
           let imageView = UIImageView(image: image)
   
           // 사진에서 보이기에 radius 처리가 되어 있던 것 같아 설정
           imageView.layer.masksToBounds = true
           imageView.layer.cornerRadius = 5 
   
           // aspect radio 1.27:1
           let aspectRatioConstraint 
               = NSLayoutConstraint(item: imageView,
                                    attribute: .height,
                                    relatedBy: .equal,
                                    toItem: imageView,
                                    attribute: .width,
                                    multiplier: (1.27 / 1.0),
                                    constant: 0)
           // constraint 설정 후
           imageView.addConstraint(aspectRatioConstraint)
   ```

   

2. #### stackView에 담아서 

   ```swift
       // stackView에 넣기
       stackView.addArrangedSubview(imageView)
   }
   ```

   

3. #### stackView의 속성들과 오토레이아웃을 맞춘다

   ```swift
   private func configImageStackView(_ stackView: UIStackView) {
       // 수평
       stackView.axis = .horizontal
     	// 같은 크기로 채우고
       stackView.distribution = .fillEqually
       stackView.alignment = .center
     	// 객체간 간격을 5
       stackView.spacing = 5
   }
   
   private func configConstraintStackView(_ stackView: UIStackView) {
      	//	오토 레이아웃을 사용하여 stackView 크기와 위치를 동적으로 계산하기 위해 false
       stackView.translatesAutoresizingMaskIntoConstraints = false
   
       let margin = self.view.layoutMarginsGuide
       stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
       stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
       stackView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10).isActive = true
   }
   ```

   

여기서 잊지 말아야 할 점은 꼭 `subView` 를 잊지 말고 만들어 둔 객체를 추가시켜줘야 한다





## 앱 기본 설정(Info.plist)



![2-2](https://user-images.githubusercontent.com/62657991/107914414-bca2b980-6fa5-11eb-877c-13514b8abd4f.png)



1. 새로운 row를 만들기 위해 해당 + 버튼을 누르거나 오른쪽 클릭 해 row를 추가한다

![2-1](https://user-images.githubusercontent.com/62657991/107914408-b90f3280-6fa5-11eb-931a-7d8fd54aa949.png)

2. 해당 list에 해당하는 내용들을 작성한다.



#### 자주 사용하는 Key 목록은 여기서 [확인](https://padgom.tistory.com/entry/iOS-infoplist-Key-목록과-사용)





## 데이터를 추상화하기 위한 설계 방식

추상화도 중요하지만 협업 및 후에 유지보수, 클린 코딩을 위해 방식을 꼭 지켜가며 설계를 해야한다!!!

### OOP

CS - OOP 수업 중 가장 와닿았던 설계 태도

```markdown
'객체지향의 사실과 오해'와 '오브젝트'를 스터디하고 계신다는 분이 객체지향 설계에 익숙해지려면 어떻게 해야하는지 궁금하다며 메일을 주셨습니다.

답장을 드리고나니 (너무 뻔한 답변같지만) 페북에 남겨도 좋을것 같아 여기에도 올립니다.

1. 도메인 관심사와 기술 관심사를 명확하게 분리하고, 도메인 관심사를 객체지향적으로 설계하는데 초점을 맞추세요.

2. 처음부터 객체지향적으로 설계하기 어렵다면 먼저 작은 기능을 절차지향적으로 구현한 후 객체지향적인 설계를 향해 리팩토링하세요.

3. 단위 테스트의 용이성으로 객체지향 설계의 품질을 측정하세요. 객체지향 설계의 품질이 좋으면 좋을수록 단위 테스트를 더 쉽게 작성할 수 있습니다.

4. 디자인 패턴을 학습하고 디자인 패턴이 적용된 다양한 예를 살펴보세요. 디자인 패턴은 역할과 책임을 어떻게 분배하고 어떤 방식으로 협력해야 설계가 유연해지는 지 알려주는 훌륭한 참고서입니다.

5. 좋은 설계는 한번에 완성되지 않습니다. 객체들의 협력이 자리잡을 때까지 반복적으로 리팩토링하세요.
```





#### SOLID 중 SRP 단일책임원칙

Single Responsibility Principle

모든 클래스는 단 한가지의 책임을 갖고 그 책임에 걸맞는 기능들이 그 안에 정의되어 있어야 한다

SOLID 를 만든 개발자의 말로는 “단일 책임 원칙은 같이 수정해야될 것들은 **묶고**, 따로 수정해야될 것들은 **분리**하는 것”이라고 했습니다.

유지 보수 차원에서 말하자면 **한 클래스**는 **한가지 책임에 관한 변경사항이 생겼을 때**만 코드를 수정하게 되는 구조가 좋은 구조라는 뜻

변경과 응집도

#### SOLID 중 OCP 열림-닫힘원칙에 대해 학습하고 정리한다.

Open/closed principle

클래스는 확장에 열려있어야 하며 수정에는 닫혀있어야 한다

즉 부모 코드를 수정하지 않고(수정에는 닫혀있고) 상속받아서 오버라이딩(확장에는 열려있어야 함)하도록 해야 한다

이런 제한이 없다면 중구난방으로 비슷한 기능들이 부모 클래스의 인스턴스로 들어오고 메소드가 다른 이름들로 사용되고 한다면 유지보수가 힘들어질 것이다

#### SOLID 중 LSP 리스코프교환원칙 대해 학습하고 정리한다.

Liskov substitution principle

부모 클래스에서 자식 클래스의 인스턴스를 대신 사용했을 때 코드가 원래 의도대로 작동해야 한다

만약 오버라이딩을 하고 싶다면 메소드의 **파라미터**와 **리턴값**의 **타입과 개수**를 맞춰서 오버라이딩하면 됩니다. 그리고 부모클래스에서 담긴 의도가 자식 클래스에서 벗어나면 안됩니다

 



### extension

- 클래스, 구조체, 열거형 혹은 프로토콜 타입에 기능을 추가
- 코드 흐름에서 복잡한 계산이 필요한 경우 따로 extension을 활용해서 깔끔하게 하기

```swift
// 랜덤 값을 가지게 하는 extension
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
```



### enum

```swift
// Associated Values활용 enum
enum  BookFormat  {
    case PaperBack (pageCount: Int, price: Double)
    case HardCover (pageCount: Int, price: Double)
    case  PDF  (pageCount:  Int,  price:  Double)
    case  EPub  (pageCount:  Int,  price:  Double)
    case  Kindle  (pageCount:  Int,  price:  Double)
    
    var  pageCount:  Int  {
        switch  self  {
        case  .PaperBack(let  pageCount,  _):
            return  pageCount
        case  .HardCover(let  pageCount,  _):
            return  pageCount
        case  .PDF(let  pageCount,  _):
            return  pageCount
        case  .EPub(let  pageCount,  _):
            return  pageCount
        case  .Kindle(let  pageCount,  _):
            return  pageCount
        }
    }
    var  price:  Double  {
        switch  self  {
        case  .PaperBack(_,  let  price):
            return  price
        case  .HardCover(_,  let  price):
            return  price
        case  .PDF(_,  let  price):
            return  price
        case  .EPub(_,  let  price):
            return  price
        case  .Kindle(_,  let  price):
            return  price
        }
    }
    
    func  purchaseTogether(otherFormat:  BookFormat)  ->  Double  {
        return  (self.price  +  otherFormat.price)  *  0.80
    }
    
}
```





## 유니코드를 적극 활용한다.

> ❤️
>
> 빨간색 하트
>
> 유니코드: U+2764 U+FE0F, UTF-8: E2 9D A4 EF B8 8F
>
> ♠️
>
> 스페이드 카드
>
> 유니코드: U+2660 U+FE0F, UTF-8: E2 99 A0 EF B8 8F
>
> ♣️
>
> 클로버 카드
>
> 유니코드: U+2663 U+FE0F, UTF-8: E2 99 A3 EF B8 8F
>
> ♦️
>
> 다이아몬드 카드
>
> 유니코드: U+2666 U+FE0F, UTF-8: E2 99 A6 EF B8 8F





![1-1](https://user-images.githubusercontent.com/62657991/107908589-bf97ad00-6f99-11eb-9c76-85cf47116db9.png)



![1-2](https://user-images.githubusercontent.com/62657991/107908601-c45c6100-6f99-11eb-8915-164b82094674.png)





# Pokergameapp-step4



- 팩토리 메소드 구현(`CardCreatable`)
- `Dealer` 구현해서 테스트 데이터 출력
  - `start`, `registerPlayer`, `shareCards`, `printHand`
- `Player` 구현
  - 출력에 필요한 이름과 카드를 가질 수 있는 빈 Array 생성
- `Dealer`도 플레이어처럼 `Playable` 프로토콜 채택해 진행
- `Card` 내 `Shape`, `Rank` `description` `extension` 삭제하고 안에서 진행

완료시간 : 02/16 18:00 



- `rankName` 삭제 enum 코드 간소화
- protocol에 `var`로 선언해도 `let`으로 선언 가능한걸 뒤늦게 알았습니다 😱
- `CardStud`, `Participant` enum 적극 활용
- `getCard` -> `appendCard`
- `CardBox` 클래스 추가
- Access Control 재 설정(`Player.cards`) - `private`는 특정 엔티티가 선언된 괄호 안에서만 사용 가능(엔티티: 데이터의 집합)



#### `playResult`

`playResult`는 다음 스텝부터 요구하는 승패 결과 로직에 따라 적용할 예정이었습니다. 그리고 다시 보니 네이밍도 적절하지 않은 것 같아 `score`로 바꿔봤습니다. 혼선이 생기지 않도록 미처 주석을 달아두지 못했던 것 같습니다. 만약 의도하신 부분이 이부분이 아니라면 다시 한 번 더 생각해보도록 하겠습니다



#### OOP, POP

객체 지향 프로그래밍과 프로토콜 지향 프로그래밍 모두 여러 유형과 상호작용하기 위해 실제 객체 및 Polymorphism을 모델링 하는 것과 같은 철학을 가지고 있습니다. 하지만 이런 철학을 구현하는 방식이 다릅니다. 어느 한쪽이 뛰어나다고 무조건 쓰지 말라고 하는 태도를 지양하는 이유가 실용성의 이유보다 철학의 이유가 크다고 느낍니다. 결국 코드를 잘 짜는 것도 유지보수, 클린코딩의 일환이고 특히 잘 짜여진 코드는 reality를 잘 나타내야 한다고 봅니다. 단적인 예로 수평적인 확장의 느낌을 가지는 프로토콜 지향 프로그래밍만으로 방대한 프로젝트를 꾸몄다고 하면 수직관계 부분은 안보이기 때문에 reality가 떨어진다고 보입니다. 코드를 읽고 수정하면서도 어색한 부분이 많으므로 많은 사람들이 달려드는 프로젝트에도 코드를 읽는 데에 수월하지는 않을 것으로 예상됩니다.

다시 제 코드로 돌아가 모든 카드를 돌려주는 `takeCardSet()`은 `Dealer`의 슈퍼클래스로 해당 관계를 나타내려 코드를 작성했습니다. 그리고 `Playable` protocol의 경우 경기를 참가한 사람들이 가지는 특성에 대해 정의를 하고 묶어놓고 싶어 protocol로 정의하게 됐습니다. 또한 이번 미션에서 두가지 패러다임을 다룬 이유도 많이 헷갈렸던 부분이고 이번 미션에 적용해서 많은 부분 습득할 수 있지 않을까 싶어 두가지 패러다임을 사용하게 됐습니다.



추가 push: 02/17 15:00

![스크린샷 2021-02-16 오후 4 40 00](https://user-images.githubusercontent.com/62657991/108032501-ee835100-7075-11eb-9606-697df7d7b529.png)





### protocol, extension

#### protocol을 만들게 된 배경

- 상속의 한계: 서로 다른 클래스에서 상속받은 클래스는 동일한 기능을 구현하기 위해 중복코드 발생 -> protocol default implimentation

  - ```swift
    // protocol default implimentation
    // class, struct에서 따로 구현하지 않아도 채택만 한다면 say에서 실행가능하다
    protocol CustomProtocol {
    	func say(msg: String) 
    }
    
    extension CustomProtocol {
    	func say(msg: String) {
        	print(msg)
        }
    }
    ```

- 카테고리의 한계

- 참조 타입의 한계: 동적 할당과 참조 카운팅에 많은 자원 소모



### extension

그런데 특정 프로토콜을 정의하고 여러 타입에서 이 프로토콜을 준수하게 만들어 타입마다 똑같은 메서드, 똑같은 프로퍼티, 똑같은 서브스크립트 등을 구현해야 한다면...?
얼마나 많은 코드를 중복 사용해야 하며 또 유지보수는 얼마나 힘들어질지 생각만 해도 머리가 아플 겁니다. 

이때 필요한 게 바로 익스텐션과 프로토콜의 결합입니다. 



#### POP 장점

- 특정 상속체계에 종속되지 않음
- class, struct, enum등 범용적인 사용, 제네릭과 결합하면 파급적인 효과(Type safe & Flexible code: 하나의 타입으로 지정 가능)

### 단점

- Objective-C 프로토콜에 Swift Extension을 붙여도 Protocol default implimentation이 구현되지 않음
- 자주 사용되는 `Delegate`, `DataSource` 등 프레임워크 프로토콜에 기본 구현 불가



### 고찰

- 확장성에 있어서는 protocol이 더 뛰어나다고 볼 수 있습니다. Class 뿐만 아니라 struct, enum에서도 사용가능하고 프로토콜만 채택하고 구현하면 되기 때문에 부모클래스의 제약을 받지 않습니다. 
- 여러 프로토콜을 채택이 가능하다: 슈퍼 클래스를 만드는 대신 특정한 기능을 포함하는 많은 프로토콜을 만들 수 있기 때문
- 원래 코드 없이 기능을 추가 할 수 있다. 즉 swift 언어 자체 프로토콜도 확장시켜 사용할 수 있기 때문 만약 슈퍼클래스에서 무언가의 기능을 추가하려면 원본 코드가 있어야 합니다. 



### OOP, POP polymorphism을 고려

OOP와 POP는 대립적인 관계에 있는 개념이 아니며, 어느 것이 더 우월하다고 말할 수는 없다. *이런 케이스에는 어떤 방식을 적용하는 것이 좋을까* 라고 생각하는 것이 좋다. 그러기 위해서는 OOP와 POP가 각각 어떤 방식으로 Polymorphism의 철학을 구현하고 있는지 알아야 하고, 장점과 한계에 대해 알아야 한다. 이런 이해를 바탕으로 설계 과정에서 Subclassing 을 사용할지 Protocol 을 사용할지 판단하는 것이 개발자의 역량이라고 할 수 있다.



스위프트에서 슈퍼클래스는 요구 사항에 대한 구현을 제공한다. 스위프트에서의 프로토콜이란 프로토콜을 따르는 타입은 반드시 프로토콜에 명시된 요구 사항을 준수해야 한다는 단순한 계약이다.
(책 본문 중)





## OOP의 Subclassing이 가지는 불편한 점들

1) 슈퍼클래스에 너무 종속적이다.

서브클래스를 생성하기 위해서는 슈퍼클래스의 코드를 제대로 파악하고 있어야 하며, 생성자와 퍼블릭 함수가 어떻게 돌아가는지 아는 것이 실수를 방지할 확률을 높인다. 즉 수퍼 클래스의 이니셜 라이저가 모든 속성을 적절하게 설정한다고 가정하기 때문에 위험할 수도 있다.

슈퍼클래스를 그대로 상속받는 구조이기 때문에, 서브클래스는 자신에게 필요없는 변수나 함수를 무조건 물려받을 수밖에 없다. 괴로운 것은 슈퍼클래스 입장에서도 마찬가지이다. 몇몇 서브클래스에만 필요한 코드들이 슈퍼클래스에 무한추가되어, 수명이 늘어날수록 몸집은 크고 코드는 더러운 클래스가 될 공산이 크다

2) Value Type을 사용할 수 없다

Swift에서 Class는 Reference Type(참조 타입)이다. 상속 구조를 사용하기 위해서는 Value Type(값 타입)으로 정의해도 무방한 모델들을 굳이 참조 타입으로 정의해야 하는 불편이 있다.

Swift에서는 참조 타입이 반드시 필요한 상황이 아니라면, 가급적 값 타입을 사용하라고 공식적으로 가이드하고 있다. 참조 타입과 값 타입의 차이, 값 타입을 권장하는 이유에 대해서는 2장에서 자세히 다룬다.

 

## POP의 편리한 점들

1) 위에서 언급한 OOP의 불편한 점들을 해결해준다

구현체 입장에서 알아야 할 것은 '프로토콜이 요구하는 변수와 함수' 뿐이다. 슈퍼클래스와 서브클래스의 의존적인 관계와 다르게, 프로토콜 기반의 구조에서는 프로토콜에 정의된 인터페이스가 무엇인지 슥 보고 그것만 구현해놓으면 된다. 슈퍼클래스를 상속받는 서브클래스들과 달리, 같은 프로토콜을 따르는(conforms to) 사이에도 끈끈하게 엮여있는 부분이 없으므로 각각이 독립적이며 그래서 안전하다. '이 프로토콜을 따른다'는 공통점 밖에 없다.

프로토콜은 참조 타입과 값 타입을 모두 지원한다. Class, Struct, Enum, ... 입맛에 맞게 사용할 수 있다.

2) 다수의 프로토콜을 따르는 것이 가능하다

상속 구조에서는 오직 하나의 슈퍼클래스만 가질 수 있다. 그러나 프로토콜의 경우에는 다수의 프로토콜을 따르는 것이 가능하다. 또한 물려받아 재사용하는 개념이 아니기 때문에, 다중 상속의 문제점으로 언급되는 죽음의 다이아몬드 이슈에서도 자유롭다.





### Access Control(접근 제어자)



`Open` & `Public` : Open과 Public 접근자 모두 선언한 모듈이 아닌 다른 모듈에서 사용가능합니다. 두 접근자의 차이점은 Open은 다른 모듈에서 오버라이드와 서브클래싱이 가능하지만 Public 접근자로 선언된 것은 다른 모듈에서는 오버라이드와 서브클래싱이 불가능 합니다.

`Internal` : 기본 접근레벨로 아무 접근레벨을 선언하지 않으면 `Internal`로 간주됩니다. `Internal`레벨로 선언되면 해당 모듈 전체에서 사용 가능합니다.

`File-private` : 특정 엔티티를 선언한 파일 안에서만 사용 가능합니다.

`Private` : 특정 엔티티가 선언된 괄호({}) 안에서만 사용 가능합니다.













