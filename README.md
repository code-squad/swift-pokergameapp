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



완료시간 : 

![스크린샷 2021-02-16 오후 4 40 00](https://user-images.githubusercontent.com/62657991/108032501-ee835100-7075-11eb-9606-697df7d7b529.png)



get만 처리한다면 





### protocol, extension











