# PokerGameApp

포커게임 앱 저장소

## STEP1. 게임판 만들기

* 게임판 배경 패턴 설정
* 이미지뷰가 7개 들어가는 스택뷰를 생성하여 7개 카드 뒷면 디스플레이
* 오토 레이아웃을 이용하여 레이아웃

**실행 화면**
![step1-result](step1-result.png)

## STEP2. 카드 클래스

* 카드 클래스 설계
    * ♥️♣️♠️♦️ 중 하나의 모양을 가진다.
    * 숫자 1-13중 하나를 가지며, 1은 A, 11~13은 JQK이다.
    * 카드 정보 출력 기능 구현 및 확인

* 카드 클래스의 숫자 프로퍼티가 가질 수 있는 값을 한정시키기 위해 enum으로 변경
    * 프로퍼티 이름도 검색해서 rank로 변경

**실행 화면**
![step2-result](step2-result.png)

## STEP3. 카드덱 구현과 테스트

* 열거형이 CaseIterable을 따르도록 하고, 모든 case에 대해 열거형 인스턴스 생성해서 카드덱 초기화
* 카드덱 구조체의 removeone, reset, shuffle 메서드 구현 및 테스트

**실행 결과**
![step3-result](step3-result.png)

