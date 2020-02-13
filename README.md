# swift-pokergameapp

## 2020.02.11
### step-1
1. StatusBar LightContent로 변경
2. 배경이미지 Assets에 등록 후 BackgroundPattern이라고 명명
3. 배경을 이미지패턴으로 지정   
<img width="200" src="https://user-images.githubusercontent.com/49548908/74218125-c0459580-4cec-11ea-9cf9-00422815ef5c.png">

4. 카드 뒷면 이미지 Assets에 등록 후 CardBackground라고 명명
5. 카드 세로 가로 비율 1:1.27 로 지정, 균일하게 7등분하여 7개의 이미지(카드뒷면) 추가   
<img width="300" src="https://user-images.githubusercontent.com/49548908/74219057-0c91d500-4cef-11ea-884a-f1eb0f63c07e.png">
<img width="300" src="https://user-images.githubusercontent.com/49548908/74219027-f08e3380-4cee-11ea-8247-f5d7e73fe3c1.png">

<br>

### step-2 (2020.2.12 11:00 ~ 15:50)
1. JK 리뷰를 토대로 리팩토링 진행(클래스 프로퍼티에 private사용, 함수를 조금 더 나눠 봄)
2. Card Class 설계 시작
3. ```Nested Enum```을 사용해서 카드의 suit와 rank를 만들었으나, 어떻게 활용해야하는지 몰라 검색 ~~(삽질 1)~~
4. 삽질 중 ```CustomStringConvertible protocol```을 찾아 공식문서 및 기타 블로그 활용하여 어떻게 사용하는지 확인 ~~(삽질 2)~~
5. Card Class를 확장하여 ```CustomStringConvertible protocol```을 채택 및 description 프로퍼티를 구현하여 준수함.
6. description 프로퍼티는 suit, rank 순으로 나오도록 정의

<br>

### step-3 (2020.2.13)
1. step2 리팩토링, Card Class에서 모든 enum에 대한 rawValue를 참조하지 말고 각 enum에서 CustomStringConvertible 프로토콜을 채택해서 description을 return하게 해준다.
역할을 나눔.
2.

