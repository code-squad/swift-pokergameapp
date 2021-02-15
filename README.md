# Pokergameapp-step3 - 카드덱 구현과 테스트



- Card 안에 `allCards()` 구현 - 모든 카드 담아서 리턴
- CardDeck 구현 - count, shuffle, removeOne, reset private로 구현

완료시간: 02/15 20:54



### 구조체와 클래스의 차이

#### Choosing Between Classes and Structures

일반적으로 다음의 조건 중 1개 이상을 만족하면 구조체를 사용하는 것을 고려해 볼 수 있습니다.

- 구조체의 주 목적이 관계된 간단한 값을 캡슐화(encapsulate) 하기 위한 것인 경우
- 구조체의 인스턴스가 참조되기 보다 복사되기를 기대하는 경우
- 구조체에 의해 저장된 어떠한 프로퍼티가 참조되기 보다 복사되기를 기대하는 경우
- 구조체가 프로퍼티나 메소드 등을 상속할 필요가 없는 경우

[참고](https://velog.io/@yoonah-dev/iOSSwift-Class와-Struct의-차이)



### Shuffle 알고리즘

- 다양한 shuffle 알고리즘에 대해 찾아본다. ex) [Fisher-Yates](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle)

두 가지 의사코드 중 아래 코드에 대해서 잠깐 설명하자면,
0~n-1사이의 값 중에 임의의 값을 취한 후 0번째 값과 교환을 합니다. 그 다음엔,
1~n-1사이의 값 중에 임의의 값을 취한 후 1번째 값과 교환을 합니다. 이런 식으로 계속 진행하면 n까지의 모든 수를 shuffle할 수 있습니다.



### Fisher-Yates shuffle algorithm

- 방법

  1. 1~n 까지의 숫자를 쓴다
  2. 지워지지 않은 숫자 중 random number *k*를 고른다
  3. 남은 숫자의 개수를 세고, 지워지지 않은 숫자 *k*를 지우고, 그 숫자를 별도의 list에 쓴다.
  4. 모든 숫자가 지워질 때까지 2번을 반복
  5. 3번에서 쓴 별도의 list가 최종 random permutation 결과이다.

   

  ```plaintext
  O(n^2)
  ```

  - 매 반복마다 남은 (지워지지 않은, 선택 안된) 숫자를 세는 과정이 필요 - O(n)
  - 랜덤 숫자 선택을 리스트 요소 개수에 비례해서 해야 함 - O(n)

  

### Knuth Shuffle

- Fisher-Yates shuffle 의 현대 버전

- 각 반복마다 **남은 element 개수를 셀 필요가 없음** -> `O(n)`

- 별도의 list 가 필요 없음. swap 할거니까

- 핵심 개념

  - 한쪽 끝(앞 혹은 뒤)부터 한자리씩 이동하면서 각 자리에 들어갈 요소를 랜덤하게 뽑음
  - 랜덤 숫자 대상: 그 자리를 포함해서 아직 정하지 않은 자리에 있는 요소들
  - 랜덤하게 뽑힐 대상 리스트를 줄여가면서, 기존에 뽑힌 요소를 배제함
  - 랜덤 함수가 O(1) 의 시간복잡도를 가지면, 전체 알고리즘은 O(n)

  

- 뽑는 대상 list는 그 자리도 포함(inclusive) 해야한다. - 그래야 원래자리에 그대로 있는 경우도 포함해서 랜덤하게 섞을 수 있음

- 대상 list가 하나 남은 경우는 어차피 뽑아도 그 요소이므로 배제

- for 문 도는 대상 Index 는 **0 ~ n-2** / **1 ~ n-1** 이어야 함

- *Example* : 앞 자리부터 한자리씩 골라 섞는 경우

  ![img](http://daheenallwhite.github.io/assets/post-image/shuffle-algorithm.png)

- Example : in Swift

  ```
  var array = [ 1,2,3,4,5 ]
    
  for i in 0..<array.count - 1 { // 0 ~ n-2
      let randomIndex = Int.random(in: i..<array.count)
        
      let temp = array[i]
      array[i] = array[randomIndex]
      array[randomIndex] = temp
  }
    
  print(array)
  //[2, 5, 1, 4, 3]
  ```





- 참조 접근자를 활용해서 정보를 감추고 인터페이스를 통해 접근하는 방식을 연습한다.
- 클래스 메모리 관리 방식에 대해 학습한다. reset() 할때 이전에 만든 카드 객체는 어떻게 되는지 확인한다.
- 메모리를 분석하는 디버깅 도구는 무엇이 있는지 학습한다.















![스크린샷](https://user-images.githubusercontent.com/62657991/107943392-f983a600-6fcf-11eb-8c5b-fb74fb6d68b3.png)