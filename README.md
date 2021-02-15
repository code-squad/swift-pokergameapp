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