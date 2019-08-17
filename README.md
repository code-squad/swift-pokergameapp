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



### Trials and Errors

#### 1) 제약 없이 center만 superview의 center와 맞춘 경우...



<img src ="./images/step1/justSetCenter.png"  position="absolute" width="100px" margin="0 auto" display="block" margin="0px auto" >

- 제약식 없이 만드는 경우, 이미지 뷰에 대한 매뉴얼 작업이 수반된다.
- 가로모드 적용시 틀이 깨지기도 함.

#### 2) not FillEqually

<img src ="./images/step1/failEx-_noFillEqually.png"  position="absolute" width="100px" margin="0 auto" display="block" margin="0px auto" >

- stackview에 addArrangedSubview 적용시 `distribution`을  `.fillEqually ` 로 설정하지 않은 경우 + `spacing` 설정 안한 경우 그림이 깨져서 나타난다.
- spacing은 뷰의 인스턴스 프로퍼티로 존재한다.  ( UIStackView.Distribution.Spacing 이걸로 접근하지 말자.)
- 방법  height에 대한 제약식이 필요하다.

#### 3) centerX 제약 적용시 유의사항

<img src ="./images/step1/centerXFail.png"  position="absolute" width="100px" margin="0 auto" display="block" margin="0px auto" >

- centerX 제약 추가시 width 제약을 누락하면 (혹은 leading이나 trailing) 스택뷰의 origin을 superview center로 잡는 문제상황이 발생할 수 있다.

