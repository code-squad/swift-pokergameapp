# Step 1
## 구현 화면
<img width="398" alt="스크린샷 2021-02-17 오전 11 13 55" src="https://user-images.githubusercontent.com/68788135/108146947-6e122e00-7111-11eb-8f9b-d883e2d4789a.png">  

## 상태 바 설정
info.plist에서 Status bar style  : Light content
https://jamesu.dev/posts/2020/03/31/how-to-make-default-status-bar-style-dark/
-> 다만 해당 설정 시 잠깐 light content였다가, viewDidLoad 후 Dark content로 돌아가서 VC 내부에서 override함.

## 배경 이미지 불러오기 ( 오류 발생시 종료 )
주어진 배경 이미지를 불러오는데 실패하면, modal창이 present, 앱 종료 버튼 touch시 앱이 suspend된다. -> 이를 위해 viewDidLoad 가 아닌, viewDidAppear에서 imageView가 추가된다. 

## 카드 배열
stackView를 사용하여 카드를 비율에 맞게 배열함.
trailing anchor의 x좌표를 좌측으로 옮기려면 -값을 줘야함.

# step 2
## 구현 화면
<img width="332" alt="스크린샷 2021-02-17 오후 4 04 09" src="https://user-images.githubusercontent.com/68788135/108167942-d117bb00-7139-11eb-8e51-58c116974c5c.png">

## 카드 생성
카드는 랜덤한 카드를 생성하거나, 원하는 카드를 생성 할 수 있다.

# step 3
## 구현 화면
<img width="863" alt="스크린샷 2021-02-18 오후 11 57 27" src="https://user-images.githubusercontent.com/68788135/108375182-14ab1b80-7245-11eb-9895-930374ed7aba.png">

## 카드 뭉치
- init() : 초기화 시, 52장의 카드를 갖으며, 초기 상태를 immutable하게 저장한다.
- count() : 카드 뭉치의 카드 숫자를 반환.
- shuffle() : 카드뭉치를 무작위로 섞는다.
- popOneCard() : 카드 뭉치의 마지막 카드를 카드 뭉치에서 제거하며, 반환한다.
- reset() : 카드 뭉치를 초기 상태로 되돌린다.

## shuffle Algorithm
Fisher-Yates shuffle -> Knuth Shuffle 
O(n^2)의 시간 복잡도를 가진 Fisher-Yates에서 발전한, O(n)의 시간 복잡도를 가진 Knuth가 있다.
``` swift
//Knuth
for index in 0..<cards.count - 1 {
    let randomIndex = Int.random(in: 0..<cards.count)
    cards.swapAt(index, randomIndex)
}
```

## class VS Struct
### 사전 요약
상속 불필요, 모델의 사이즈 작음 -> struct
Json mapping 필요 -> struct
serialize하여 전송, 파일 저장 -> class
Obj-C 호환 필요? ->class

### struct
- value type : call by value -> 복사되어 할당.
- memory : stack : 비교적 빠름 -> scope based lifetime : compiler가 언제 메모리 할당/해제 할 지 정확히 알 고 있음.
- 상속 불가.
- protocol 사용 가능.
- Codable protocol을 사용하여 JSON <-> Struct 변환 가능 Swift4 +
- cant Serialize with NSData
- value type 변수가 closure에 의해 capture되는 경우 -> reference copy : default
-> How to Value copy? : 해당 변수를 capture list에 넣기
``` swift
var a = 0
var b = 0
let closure = { [a] in
    print(a,b)
}
a = 10
b = 10
closure()
//print 0 10
```

### class
- reference type : call by reference -> 객체의 메모리 주소값을 복사
- memory : heap : 비교적 느림 -> reference counting을 통한 dealloc 필요
- 상속 가능
- can Serialize with NSData
- Codable protocol 불가
- typeCasting 가능
- deinit 존재.

### 특이 사항
컬렉션 Array, Dictionary 같은 컬렉션은 struct
-> 파라메터로 넘길 때 모든 값을 복사 전달하는 overhead? -> 발생 안함.
Swift의 가변길이 컬렉션은 overhead를 막기위해 copy-on-write 방식 채용
array안의 데이터들은 heap에 저장. 
array를 copy 시, 해당 데이터의 메모리 주소를 참조하는 껍대기 형태의 Array가 새롭게 생성됨. -> overhead 없음.
but, array의 데이터 추가, 삭제 시 heap data의 복사가 일어나고, 새로이 할당됨

``` swift
let myArray = [1, 2, 3]

// 단순 복사: myArray struct가 otherArray로 copy되었지만 껍데기만 복사됨
// 메모리 사용 증가량: 거의 없음
// -> [1, 2, 3] 데이터를 저장하고 있는 heap영역 메모리는 myArray와 otherArray가 공유해서 사용하고 있음
let otherArray = myArray

// 데이터 수정: otherArray를 수정하기 위해 실제 heap영역에서 데이터 복사가 일어나게 된다
// 메모리 사용 증가량: 거의 2배로 늘어남
// -> 기존에 myArray 를 위해 [1, 2, 3] 데이터에 대한 heap 영역 메모리가 할당되어있고
// -> 신규로 otherArray를 위해 [1, 2, 3, 4] 데이터에 대한 heap 영역 메모리가 추가로 할당되었기 때문
otherArray.append(4)
```
출처 : https://www.letmecompile.com/swift-struct-vs-class-%EC%B0%A8%EC%9D%B4%EC%A0%90-%EB%B9%84%EA%B5%90-%EB%B6%84%EC%84%9D/

## 질의 응답
### array의 초기화와 removeAll()의 성능 차이?
``` swfit
var array = []
array.removeAll()
```
-> removeAll() 은 O(n)의 시간 복잡도를 가짐. -> array의 크기에 따라 결과가 다를 것.

### deck.reset() 시 이전의 카드들은 메모리에서?
Test전 결과 예상 : 
Deck.popOneCard() 시 뽑힌 한장의 카드가 deinit 될 것.
Deck.reset() 시 Deck에 남은 카드가 전부 deinit 될 것

Test 내용 : 
<img width="295" alt="스크린샷 2021-02-19 오전 1 30 06" src="https://user-images.githubusercontent.com/68788135/108389605-2c899c00-7253-11eb-8c51-93f68d027070.png">
해당 결과는 Deck.init() 시 console에 표시된 결과.

결과 : Deck.popOneCard(), Deck.reset() 실행 시 Card의 deinit이 일어나지 않았다. 

고찰 : 
메모리 반환에 대한 생각 :
console에 출력되는 내역이 처음에는 init에서 나온다고 생각했습니다.
하지만, 이게 아니라 testDeck이 제거되며 출력된 내용이라고 생각합니다.

카드 뭉치가 비었을 경우 랜덤한 카드를 반환하는 코드 일 때, 53장의 카드를 뽑아보았는데, 뽑아서 출력된 뒤 바로 메모리에서 제거되는 것을 확인했습니다.

카드 뭉치가 충분할 때, popOneCard()를 해도 반환되지 않는 것은, Deck.firstState가 모든 card를 참조하기 때문이라고 생각합니다.

# step 4
## 구현 화면

<img width="297" alt="스크린샷 2021-02-19 오후 5 30 00" src="https://user-images.githubusercontent.com/68788135/108478785-43be9d00-72d8-11eb-9dac-a1a4833400ce.png">  
