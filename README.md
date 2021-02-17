# swift-pokergameapp


#### 요구사항
- StatusBar 스타일 LightContent
- Background를 이미지 패턴으로 설정
- 카드 뒷모습 ImageView 가로세로(1:1.27)로 생성

#### 해결방법
- StatusBar 스타일 LightContent
  - 코드로 지정(해당 vc)
  - Info.plist로 지정(앱전체)
- Background를 이미지 패턴으로 설정
  - 1x 2x 3x 이미지 적용
- 카드 뒷모습 ImageView 생성
  - 스택뷰와 오토레이아웃 적용

![스크린샷 2021-02-16 오후 1 57 24](https://user-images.githubusercontent.com/73683735/108020135-0a2f2d00-705f-11eb-9fa3-035557116596.png)

#### 완료날짜 2021년 02월 16일(화) 14:00

---
---

# 카드 클래스


#### 요구사항
- 카드 클래스 생성
- 콘솔에 카드 출력

#### 해결방법
- 카드 클래스 생성
  - 카드의 모양이나 숫자는 범위가 지정된 값 내에서 사용되어야 하므로 enum타입 사용 
- 콘솔에 카드 출력
  - CustomStringConvertible 사용, enum에도 CustomStringConvertible 사용할 수 있었다.

![스크린샷 2021-02-17 오후 3 04 50](https://user-images.githubusercontent.com/73683735/108162990-9578f300-7131-11eb-8b16-5dce2d4907d3.png)

#### 완료날짜 2021년 02월 17일(수) 14:00
