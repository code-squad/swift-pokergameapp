# Pokergameapp-final



- #### 스텝별 작업 목록

- [x] 딜러와 참여자가 가진 카드를 요구사항에 맞춰서 계산해서 승자를 선택한다.
- [ ] 선택한 승자에 대한 표시를 화면에 출력한다.
  - 요구사항에서 `UIImageView` 를 추가를 원했지만 `UIImageView` 를 오토 레이아웃을 설정하는데에 원하는대로 나오지 않게 됐습니다.
  - 해당 부분 계속해서 진전이 없고 시간을 너무 많이 잡아먹어 지체될 것 같아 다음 미션 풀고난 후 개인적으로 해결해보려 합니다...........

- #### 학습 키워드

  - `CarIterable` : 잘못 사용하면 무한 재귀 호출이 되는 것을 알았습니다
  - `closure` : 지적해주신 부분들 closure를 사용해서 이전보다는 사용이 수월해졌습니다.
  - `constraint` : programmatically하게 작성하는 것에 대해 감을 잡았다 싶으면서도 제 마음대로 작동이 안되서 너어무 답답했습니다. 하나하나 뜯어보면서 연구가 필요해보입니다.

- #### 고민과 해결

  - `CaseIterable` 의 사용이 생소해서 이것저것 해보고 찾아봤습니다.
    - `lhs`, `rhs` 의 타입을 바꿔도 되는 건지: 다른 타입을 비교한다는 것 자체가 안정성 측면에서 말이 안되는 거였다
    - 왜 계속해서 호출이 되는지: 검색보다는 디버깅툴에서 해당 부분 살펴보고 수정했다. 유의가 필요해보였다.

- #### 부연 설명

  - **view 구조 설명**

    ![description](https://user-images.githubusercontent.com/62657991/108839547-8d7cef80-7618-11eb-9888-843377d626e8.png)

  

  - **승자 규칙 구현**

    - `Score` 라는 enum 타입을 추가했습니다. 안에는 `fourCard`, `straignt` 등 score 분류와 `Rank` 매개변수 값을 가질 수 있도록 했습니다.

    - `Dealer`가 score를 계산합니다. 같은 rank끼리 카운트해서 dictionary 형태로 담아둔 후 각각의 score 로직에 맞게 구현합니다.

    - **로직 내 변수 설명**(주석으로도 남겼습니다)

      - `maxCardScore`: eachCardScore 중 가장 높은 score를 Dictionary 형태로 가집니다

      - ` straightScore`: straignt 판정합니다. 아니라면 .none을 반환합니다

      - `correctTwoPairs` : TwoPair 판정을 위해 같은 카드가 두개인 것을 일단 골라냅니다.

