# Step2 포커게임 앱

## Step2-1 게임판 만들기 요구사항
* 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
* ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
* 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가한다.
* ViewController 클래스에서 코드로 화면을 균등하게 7등분해서 7개 UIImageView를 추가하고 카드 뒷면을 보여준다.(카드 가로와 세로 비율은 1:1.27)

 **[구현 화면]**
![](https://i.imgur.com/qEDW696.png)

---
#### UIStatusBar 스타일 변경방법
* info.plist로 변경
> View controller-based status bar appearance - NO
>> YES로 한다면 ViewController에서 설정값을 다 넣어줘야 한다

> Status Bar Style - default / darkContent / lightContnet
> 
>> default : 기본적으로 밝은 배경화면에서 사용(까만글씨)
> darkContent: 밝은 배경화면에서 사용(까만글씨)
> lightContent: 어두운 배경화면에서 사용(하얀글씨)
* 코드로 변경
``` swift
 override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
```
출처 : https://mrgamza.tistory.com/630, https://zeddios.tistory.com/569

#### UIStackView
>StackView의 속성
>>axis 
>>alignment 
>>distribution  
>>spacing

--- StackView와 관련해 추후 추가예정....

View의 Constraint를 적용해줄 경우에는,
.isActive = true를 꼭 해줘야지만 constraint가 적용된다!

완료 : 2020.2.9 9:14
