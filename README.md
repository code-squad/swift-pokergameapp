# Poker Game App 🃏
## Step 1 - 게임판 만들기 (🎉 Feb 15)

- 앱 구동 시 타일 패턴으로 이루어진 `게임판`과 7장의 `카드` 뒷면이 나타난다.  
- `카드`의 크기는 **디바이스 크기**에 따라 자동 조절된다.

![step1](https://user-images.githubusercontent.com/72188416/107912907-c24ad000-6fa2-11eb-8298-a1ee6c4f9928.png)

<br>

## Step 2 - 카드 클래스 (🎉 Feb 15)

- 앱 구동 시 2장의 `카드` 정보를 콘솔에 출력

![step2](https://user-images.githubusercontent.com/72188416/107930032-cd5f2980-6fbd-11eb-893b-71202a1cb52a.png)

<br>

## Step 3 - 카드덱 구현과 테스트 (🎉 Feb 16)

- 앱 구동 시 `카드 덱`을 구성하고 섞는다.
- `카드` 3장을 뽑는다.
- 위의 과정을 콘솔 창에 출력한다.

![step3](https://user-images.githubusercontent.com/72188416/108039266-39559680-707f-11eb-804f-b3e2a6739d4a.png)

<br>

## Step 4 - 포커 딜러와 게임 테스트 (🎉 Feb 18)

- 앱 구동 시 **five card stud **룰에 따른 3인 플레이 결과가 출력된다.
- 만약 `딜러`에게 남은 `카드`가 게임 진행에 필요한 수보다 적다면 게임 종료 메시지를 출력한다.

![step4](https://user-images.githubusercontent.com/72188416/108311279-24504300-71f8-11eb-8681-d2f37ba1bd23.png)



## Step 5 - 포커게임 결과 화면 (🎉 Feb 22)

- `SegmentedControl`을 통해 게임 룰(7 Cards / 5 Cards)과 플레이 인원(2인 / 3인 / 4인)을 선택할 수 있다.
- 게임 룰 변경 시 바뀐 룰에 따라 `카드`가 재분배되며, 화면이 다시 로드된다.

<img width="704" alt="step5" src="https://user-images.githubusercontent.com/72188416/108679983-a3af8080-7530-11eb-8dc2-96d8c2c1ed3d.png">