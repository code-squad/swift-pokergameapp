# swift-pokergameapp


## STEP 1

### 결과화면

<style>
  custom {
    position:absolute;
    font-family: 'Helvetica Neue', Helvetica, sans-serif;
    font-size: 20px;
    width: 100%;
    text-align: center;
  }
</style>
<table style="margin: auto; text-align: center;">
  <tr colspan="2">
    <td>
        <p class="custom">
          <b>세로모드</b>
        </p>
    </td>
    <td >
        <p class="custom">
          <b>가로모드</b>
        </p>
    </td>
  </tr>
  <tr colspan="2">
    <td >  
      <p class="custom">
        <img src ="./images/step1/resultVertical.png"  position="absolute" width="300px" margin="0 auto" display="block" margin="0px auto" >
      </p>
    </td>
    <td>
      <p class="custom">
        <img src ="./images/step1/resultHorizontal.png" position="absolute" width="300px" margin="0 auto" display="block" margin="0px auto" >
      </p>
    </td>
  </tr>
</table>



###구현 내용

- 코드레벨에서 오토레이아웃 제약 

- 스택 뷰 활용
- lightContent로 설정
- 백그라운드 이미지패턴(반복패턴) 적용



### 학습 내용

- NSLayoutConstraint
- view.centerXAnchor.constraint(equalTo: NSLayoutAnchor<NSLayoutXAxisAnchor>)
- UIColor.init(patternImage: )
- UIStackView

