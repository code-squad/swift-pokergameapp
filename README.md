# Pokergameapp-final



![description](https://user-images.githubusercontent.com/62657991/108575454-a443ed80-735d-11eb-850d-e75a0a181e64.png)

#### `pokerPlate: UIStackView`

- `playerStackView`를 감싸고 있는 StackView

- `SegmentIndex`변경 시 view 변경 용이하게 하기 위해 사용했습니다.

#### `playerStackView: UIStackview`

- 그대로 `playerStackView` 안에다가 넣으면 정렬이 어렵기 때문에 한 번 더 StackView로 감싸줬습니다.

#### `nameLabel: UILabel`

- 참가자 name 설정

- 기존 새로 `player`선언 시 ID가 증가하는 구조에서 참가자2~4의 이름으로 수정

#### `imageStackView: UIStackView`

- `imageView` 를 감싸는 `UIStackView`



### 동작

- 처음 실행 시 `SegmentedControl` 의 디폴트 값인 7 Card, 2명에 맞춰 실행하게 됩니다

- `SegmentedControl` 을 선택하면 해당 조건에 따른 카드가 새로 세팅됩니다







Protocol 'Playable' can only be used as a generic constraint because it has Self or associated type requirements



















