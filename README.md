# Step 1
## 기능

## 상태 바 설정
info.plist에서 Status bar style  : Light content
https://jamesu.dev/posts/2020/03/31/how-to-make-default-status-bar-style-dark/
-> 다만 해당 설정 시 잠깐 light content였다가, viewDidLoad 후 Dark content로 돌아가서 VC 내부에서 override함.

## 배경 이미지 불러오기 ( 오류 발생시 종료 )
주어진 배경 이미지를 불러오는데 실패하면, modal창이 present, 앱 종료 버튼 touch시 앱이 suspend된다. -> 이를 위해 viewDidLoad 가 아닌, viewDidAppear에서 imageView가 추가된다. 

## 카드 배열
stackView를 사용하여 카드를 비율에 맞게 배열함.
