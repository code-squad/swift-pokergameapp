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
