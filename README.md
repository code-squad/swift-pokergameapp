# swift-pokergameapp
STEP15 포커게임 앱 저장소



2021.02.15

혹시나 해서 남겨둔  git log 첨부합니다!

<img width="878" alt="스크린샷 2021-02-17 오전 11 46 41" src="https://user-images.githubusercontent.com/60323625/108171006-3bcaf580-713e-11eb-8758-01ca59fe7ab0.png">



statusBarManager 

View controller-based status bar appearance

### STEP1. 게임판 만들기

1. asset에 이미지를 추가한다

   홈페이지를 만들때 asset을 사용해서 이것저것 꾸몄었는데 모바일에서는 어떻게 사용하는 걸까

   asset에 여러 catalog에는 여러 타입이 있고 버튼을 사용하거나 배경을 지정하는 등 여러 분야에서 사용된다

   https://devcindy.tistory.com/1 

2. Status bar style -> statusBarManager 

   'statusBarStyle' was deprecated in iOS 13.0: Use the statusBarManager property of the window scene instead.

3. 카드배치

- [view.frame vs view.bounds] (https://zeddios.tistory.com/203)

frame은 상위뷰를 기준으로!

bounds는 나 자신이 기준이다!

--> 상위뷰를 기준으로 7등분하여 배치하였다.

* stackView
  - stackView.translatesAutoresizingMaskIntoConstraints = **false** // default: true이기에 뷰를 더 추가할 수 있도록 설정한다!
