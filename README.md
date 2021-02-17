# swift-pokergameapp

## Step01

### 프로그래밍 요구사항
- 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
- 배경을 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
- 카드 뒷면 이미지를 지정한다.
- ViewController 클래스에서 코드로 아래 출력 화면처럼 화면을 균등하게 7등분해서 7개 UIImageView를 추가하고 카드 뒷면을 보여준다.
- 카드 가로와 세로 비율은 1:1.27로 지정한다.

###  결과
<img width="500" alt="Screen Shot 2021-02-15 at 4 14 13 PM" src="https://user-images.githubusercontent.com/60229909/107915989-d98cbc00-6fa8-11eb-9f47-4e01198ab64b.png">

<img width="300" alt="Screen Shot 2021-02-15 at 4 19 37 PM" src="https://user-images.githubusercontent.com/60229909/107916410-9aab3600-6fa9-11eb-9c94-91a3187fa634.png"><img width="500" alt="Screen Shot 2021-02-15 at 4 29 06 PM" src="https://user-images.githubusercontent.com/60229909/107917219-edd1b880-6faa-11eb-8c6f-8132faf118e2.png">

## Step02

### 프로그래밍 요구사항
- 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
- 속성으로 모양 4개 중에 하나, 숫자 1-13개 중에 하나를 가질 수 있다.
- 모양이나 숫자도 적당한 데이터 구조로 표현한다. 클래스 혹은 Nested enum 타입으로 표현해도 된다.
- 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
- 문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
- ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력한다.

### 결과
```
❤️A
```

#### 📌Card객체를 Class가 아닌 Struct로 설계한 이유

구조체와 클래스의 가장 큰 차이점은 값을 전달할 때에 복사를 하느냐, 참조를 하느냐이다. 구조체의 경우 값을 복사하고, 클래스의 경우 값을 참조한다. 
PockerGameApp에서 Card 객체는 생성된 한번 생성된 인스턴스에 대하여 값을 변경하지 않는다. 클래스로 만들어 참조 시 원본 값이 변경될 위험이 있기 때문에 클래스가 아닌 구조체로 설계하였다. 


## Step03

### 프로그래밍 요구사항
- `count` 갖고 있는 카드 개수를 반환한다.
- `shuffle` 기능은 전체 카드를 랜덤하게 섞는다.
- `removeOne` 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
- `reset` 처음처럼 모든 카드를 다시 채워넣는다.

### 결과

<img width="700" alt="Screen Shot 2021-02-15 at 9 08 19 PM" src="https://user-images.githubusercontent.com/60229909/107944721-eeca1080-6fd1-11eb-8c09-e1bcbcc0da97.png">

<img width="700" alt="Screen Shot 2021-02-15 at 9 15 59 PM" src="https://user-images.githubusercontent.com/60229909/107945463-0229ab80-6fd3-11eb-99b8-ca49bc3b361a.png">

<img width="700" alt="Screen Shot 2021-02-15 at 9 25 10 PM" src="https://user-images.githubusercontent.com/60229909/107946365-49646c00-6fd4-11eb-8c54-e57f20bad2aa.png">

## Step04

### 프로그래밍 요구사항
- 카드덱을 활용해서 포커 게임 딜러 동작을 하도록 프로그램을 설계하고, 각 역할을 담당하는 클래스 구현한다.
- 포커 딜러 선택을 위한 새로운 입력 뷰가 있다고 가정한다.
- 게임은 7카드스터드 방식과 5카드스터드를 지원한다.
- 참여자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다.
- 카드게임 종류와 참여자수에 따라 각기 다른 동작을 해야한다.
- 카드가 남은 경우는 계속해서 게임을 진행하고, 카드가 부족할 경우 종료한다고 가정한다.
- 카드 게임 규칙과 참여자 수에 따라서 각기 다른 방식으로 카드를 뽑아 출력한다.
- 각 클래스 동작을 확인하기 위한 PokerGame 객체를 작성한다.

### 객체 설계
1. PokerGame
    - 게임을 시작한다.
    - 플레이어들에게 카드를 나누어 준다.
    - 카드가 남는 경우 계속해서 게임을 진행한다.
    - 카드의 개수가 부족할 경우 게임을 종료한다.

2. Player 
    - 카드를 갖는다.

3. InputView
    - 게임은 7카드스터드 방식과 5카드스터드 방식 중 선택
    - 딜러 수 1명
    - 참가자 수 1~4명 중 선택

### 결과
<img width="550" alt="Screen Shot 2021-02-17 at 11 32 24 AM" src="https://user-images.githubusercontent.com/60229909/108148260-cf3b0100-7113-11eb-8188-c12d25564f54.png"><img width="550" alt="Screen Shot 2021-02-17 at 11 32 48 AM" src="https://user-images.githubusercontent.com/60229909/108148297-df52e080-7113-11eb-9982-287801003daf.png">
