# swift-pokergameapp
STEP15 포커게임 앱 저장소

<details>
<summary>step 1 : 게임판 만들기</summary>
<div markdown="1">

## step 1 : 게임판 만들기

<img width="300" alt="image" src="https://user-images.githubusercontent.com/37682858/74084348-89d00680-4ab1-11ea-8449-c8de4036aa7e.png">

### 추가한 기능

* 오토레이아웃 사용을 위해 다음과 같은 코드 추가

  * ```swift
    translatesAutoresizingMaskIntoConstraints = false
    ```

  * 스토리보드에서 constraint를 설정해주면 위 코드가 자동으로 실행 되지만, viewController에서 코드로 constraint를 적용해주면 자동으로 실행 안됨.

  

* 배경 이미지 설정

  ``` swift
  self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
  self.view.addSubview(stackView)
  ```

  asset에 있는 bg_pattern이라는 이미지를 불러와서 패턴 이미지를 배경으로 설정 해줌

  

* 카드 이미지 추가

  * rootView에 stackView를 삽입하여 여러장의 imageView를 추가할 수 있게 함.

    ```swift
    self.view.addSubview(stackView)
    ```

  * stackView에 constraint를 설정하여 디스플레이의 크기가 달라져도 항상 동일한 비율 유지하도록 함.

    ``` swift
    self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive=true
    self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive=true
    self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive=true
    ```

  * imageView의 constraint를 설정하여 항상 가로 : 세로의 비율이 1:1.27이 되도록 설정

    ``` swift
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive=true
    ```


2020.02.08

</div>
</details>



<details>
<summary>step 2 : 카드 클래스</summary>
<div markdown="1">

## step 2 : 카드 클래스

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/37682858/74120729-e3e2e000-4c07-11ea-81ee-432166f029e1.png">



### 추가한 기능

* Card class 추가

  * 카드의 모양과 숫자(문자)를 정의하는 enum을 class 내 nested하게 구현

  * 카드의 모양과 숫자(문자)를 저장하는 rank,suit 변수 생성

  * CustomStringConvertible 프로토콜을 채용하여 Card 인스턴스를 문자열로 반환하는 표현 제공 

    ```swift
    extension Card:CustomStringConvertible{
        var description: String {
            return String(self.suit.rawValue)+self.rankString
        }
    }
    ```

  * enum에 CaseIterable 프로토콜을 채용하여 추후 Card 객체 생성 시 enum을 collection으로 반환하여 순환하며 생성 가능

* ViewController 클래스에서 Card 인스턴스 생성 후 출력 함.



2020.02.10

</div>
</details>



## step 3 : 카드덱 구현과 테스트

### 추가한 기능

* CardDeck 구조체 구현
  * cardSet:[Card]
  * count() : 현재 가지고있는 카드 개수 반환
  * shuffle() : 현재 카드를 랜덤하게 섞음, 카드가 2장 이상일 때만 동작함.
  * removeOne() : 카드 목록의 맨 마지막 인스턴스를 반환하고 목록에서 삭제, 카드가 없는 경우 nil 반환
  * reset() : 새로운 Card 배열을 cardSet 프로퍼티에 할당해 줌
* CardDeck, Card 인스턴스를 각각 서로 비교하기 위해 Equatable 프로토콜을 채용함.
  * Card 끼리 비교할 경우 Card 인스턴스를 문자열로 반환하여 값이 같은지를 비교
  * CardDeck끼리 비교할 경우 CardDeck 내의 Card의 인덱스별로 값이 같은지 다른지를 비교
* CardDeck test함수 구현
  * testShuffle()
    * 셔플하기 전의 카드 덱과 셔플한 후의 카드덱을 저장하였다가 비교
  * testRemoveOne()
    * 카드가 없을 경우 nil을 반환 하는지
    * 카드가 있다면 반환 전의 카드 개수와 반환 후의 카드 수가 1만큼 차이 나는지
  * testReset()
    * reset 후 카드의 수가 52개인지 확인



### 더 알아 본 것

#### 구조체와 클래스의 차이

* struct
  * value 타입
  * 인스턴스가 메모리의 stack에 생성됨
  * 값을 전달 할 때 값을 복사 후 전달하기 때문에 전달받은 객체에서 값을 바꿔도 본래의 값은 바뀌지 않음
* class
  * reference 타입
  * 인스턴스가 메모리의 heap에 생성되고, 인스턴스를 가리키는 변수는 stack에 생성됨
  * 값을 전달할 때는 주소값을 전달하기 때문에 전달 받은 객체에서 값을 바꾸면 본래의 값도 바뀜

#### shuffle 알고리즘

* fisher yates 알고리즘

  1. 값이 들어있는 배열과 result를 담을 빈 배열을 준비한다.
  2. 기존 배열에서 하나의 값을 랜덤으로 추출하여 result 배열에 담는다.(기존의 배열에서 추출된 값은 삭제된다.)
  3. 기존 배열의 길이가 0이 될 때까지 2번을 반복
  4. result를 반환한다.

  

#### 클래스의 메모리 관리 방식

특정 변수가 참조하고있는 인스턴스의 참조 카운트가 0이 되면 메모리를 해제함.

변수가 인스턴스를 참조하면 인스턴스의 참조 카운트가 1 늘어 나고, 참조를 해제하면 1 줄어들음.

