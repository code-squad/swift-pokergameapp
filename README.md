# 1단계 게임판 만들기

2021.02.15(월)

### 1. 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 설정

<img width="667" alt="스크린샷 2021-02-15 오후 3 15 07" src="https://user-images.githubusercontent.com/73586326/107911929-dc83ae80-6fa0-11eb-9750-89475901cb2f.png">

Status Bars
statusBar는 화면의 상단 가장자리에 표시되며 시간, 이동통신사, 네트워크 상태 및 배터리 수준과 같은 디바이스의 현재 상태에 대한 유용한 정보를 표시합니다. statusBar에 표시된 실제 정보는 디바이스 및 시스템 구성에 따라 다릅니다.

[출처 및 참고](https://zeddios.tistory.com/569)

### 2. ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정 (이미지 파일은 Assets에 추가)

<img width="1637" alt="스크린샷 2021-02-15 오후 3 15 49" src="https://user-images.githubusercontent.com/73586326/107911955-ead1ca80-6fa0-11eb-9d98-e65aa18848e6.png">

### 3. 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가

<img width="1519" alt="스크린샷 2021-02-15 오후 3 18 30" src="https://user-images.githubusercontent.com/73586326/107912039-15bc1e80-6fa1-11eb-91e9-62a27a3153c0.png">


### 4. ViewController 클래스에서 코드로 아래 출력 화면처럼 화면을 균등하게 7등분해서 7개 UIImageView를 추가하고 카드 뒷면을 보임

### 5. 카드 가로와 세로의 비율은 1:1.27로 지정

<img width="1792" alt="스크린샷 2021-02-15 오후 9 14 18" src="https://user-images.githubusercontent.com/73586326/107955890-b29eac00-6fe1-11eb-8689-3d21467f36d5.png">

<img width="1764" alt="스크린샷 2021-02-15 오후 10 48 24" src="https://user-images.githubusercontent.com/73586326/107955948-cb0ec680-6fe1-11eb-9aa3-0226438b4f03.png">
