# swift-pokergameapp
## Step-1 게임판 만들기

<p align="center">
<img width="500" alt="step1" src="https://user-images.githubusercontent.com/45817559/107949316-6b5fed80-6fd8-11eb-865a-b132b69a97fb.png">
</p>

- StatusBarStyle 변경
- 배경, 카드 이미지 Asset에 추가 후 로드
- frame길이를 통해 카드 너비, 높이 지정

완성 날짜: 2021.02.15 월요일 오후 9:59분

## Step-2, 3

<p align="center">
<img width="533" alt="step2,3-1" src="https://user-images.githubusercontent.com/45817559/108171497-ed6a2680-713e-11eb-94ea-0a4cbc391cc2.png">
</p>

<p align="center">
<img width="533" alt="step2,3-2" src="https://user-images.githubusercontent.com/45817559/108171516-f78c2500-713e-11eb-9e0b-cb4b214ac635.png">
</p>

- 카드 데이터를 추상화해서 클래스로 구현.
- 클래스를 print할 때, CustomStringConvertible 프로토콜을 채택해 커스터마이징
- 카드 덱 구현
    - count: 갖고 있는 카드 개수 반환
    - shuffle: 전체 카드를 랜덤하게 섞음
    - removeOne: 카드 인스턴스 중 하나를 반환하고 목록에서 삭제
    - reset: 처음처럼 모든 카드를 다시 채워넣음

완성 날짜: 2021.02.17 수요일 오후 4:41분

## Step-4

<p align="center">
<img width="300" alt="step4" src="https://user-images.githubusercontent.com/45817559/108452693-40adb780-72ac-11eb-8f9a-ebb4bb52503a.png">
</p>

- 플레이어 수와 Stud 방식을 선택할 수 있습니다.
- 카드가 남는 경우는 계속해서 게임을 진행하고, 부족한 경우 게임을 종료합니다.
