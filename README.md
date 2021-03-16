# swift-pokergameapp

# Step 1 Make pocker frame.

- pocker의 기본이 되는 백그라운드와 카드를 배치했다.
- 하나의 이미지로 격자패턴을 생성.
- StackView 를 공부하고 옵션을 이용하여 들어갈 이미지뷰를 배치함.

<Img src = "https://user-images.githubusercontent.com/52390975/110789611-6b8b9a00-82b3-11eb-9e3c-fd90a8a64d02.png" width = "200">

# Step 2 Learn OOP

### 2021.3.12 3:30PM
- OOP를 배우고 포커게임의 기본이 되는 뼈대(클래스)를 만든다.
- 이모지를 넣을 수 있는 방법을 공부하고, 유니코드를 공부한다.
- Enum을 이용하여 매직넘버를 구축한다.

<img width="200"  src="https://user-images.githubusercontent.com/52390975/110901023-02edfd00-8347-11eb-9384-591704bb050b.png">

# Step 3 Deep OOP

### 2021.3.15 10:00 pm
- OOP 구조를 이용해서 변수의 immutable의 중요성을 파악했다. 외부에서 클래스 변수를 함부로 참조하면 안되는 점.
- enum의 iterable를 위한 caseIterable 과 고차함수 forEach를 이용해서 카드덱 초기화를 구현했다.
- Durstenfeld's version의 구조를 보고 셔플방식을 구현하였다.
- 초기화, 셔플에서는 기존 변수를 그대로 이용하려고 해서 새로운 메모리를 최대한 줄이려고 구현함.
- 실행중에 메모리를 볼 수 있는 버튼을 클릭하여 구조를 보았다. 정확히 무엇을 의미하는지는 더 공부가 필요하다고 느낌

<img width="200" alt="Screen Shot 2021-03-15 at 9 33 25 PM" src="https://user-images.githubusercontent.com/52390975/111155988-8eca8800-85d8-11eb-8dbc-dd03adb1262e.png">

<img width="200" alt="Screen Shot 2021-03-15 at 9 43 12 PM" src="https://user-images.githubusercontent.com/52390975/111156024-9be77700-85d8-11eb-9295-591055be42b3.png">

# Step 4 Make pocker frame.
### 2021.3.16 10:00 pm
- OOP적 접근방식
- 1. 딜러와 플레이어를 사람으로부터 상속받으려다가 두 클래스가 타입만 다를뿐 나머지 개념이 같다고 생각해서 사람 클래스 하나만을 생성함.
- 2. Error 핸들링을 알아보고, 플레이어 수의 min, max의 bound를 init에서 정해주었다.
- 3. Enum의 CustomStringConvertible를 다시한번 공부하고 string에 한하여 rawValue를 안쓸수 있게 공부해보았다. 
- 4. print문을 로직에서 최대한 사용하지 않도록 노력하려고 한다. 디버깅 브레이크 포인트를 찍어봐야 할 것 같다.

