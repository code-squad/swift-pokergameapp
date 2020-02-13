# swift-pokergameapp
STEP15 포커게임 앱 저장소



## Step1 - 게임판 만들기

- 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
- ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
- 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가한다.
- ViewController 클래스에서 코드로 아래 출력 화면처럼 화면을 균등하게 7등분해서 7개 UIImageView를 추가하고 카드 뒷면을 보여준다.
- 카드 가로와 세로 비율은 1:1.27로 지정한다.



<img src="https://user-images.githubusercontent.com/40784518/73843413-f359d600-4861-11ea-9152-4621cd453f77.png" width="50%"></img>



## Step5 - 포커게임 결과화면

- 각각의 카드 정보에 맞게 이미지 매칭
- 선택된 Stud / Player Count 에 따라 출력되는 카드의 갯수와 이미지 변경
- App의 shake 동작시 카드 섞이도록 구현 

<img src="https://user-images.githubusercontent.com/40784518/74433200-4e637c80-4ea3-11ea-9bf9-33dccf460c26.png" width="50%"></img><img src="https://user-images.githubusercontent.com/40784518/74433246-64713d00-4ea3-11ea-8693-4c97a1508eab.png" width="50%"></img>

 