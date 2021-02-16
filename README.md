# Pokergameapp-step3 - 카드덱 구현과 테스트



- Card 안에 `allCards()` 구현(모든 카드 담아서 리턴)
- CardDeck 구현 - count, shuffle, removeOne, reset private로 구현



완료시간: 02/16 10:00

![스크린샷 2021-02-15 오후 9 29 01](https://user-images.githubusercontent.com/62657991/107946786-da3b4780-6fd4-11eb-8833-4bb0fcdbf519.png)



### 구조체와 클래스의 차이

#### Choosing Between Classes and Structures

일반적으로 다음의 조건 중 1개 이상을 만족하면 구조체를 사용하는 것을 고려해 볼 수 있습니다.

- 구조체의 주 목적이 관계된 간단한 값을 캡슐화(encapsulate) 하기 위한 것인 경우
- 구조체의 인스턴스가 참조되기 보다 복사되기를 기대하는 경우
- 구조체에 의해 저장된 어떠한 프로퍼티가 참조되기 보다 복사되기를 기대하는 경우
- 구조체가 프로퍼티나 메소드 등을 상속할 필요가 없는 경우

[참고](https://velog.io/@yoonah-dev/iOSSwift-Class와-Struct의-차이)



### Shuffle 알고리즘

- shuffle의 핵심은 이미 뽑혔던 element는 뽑히지 말아야 한다는 점이다.

### Fisher-Yates shuffle algorithm

- 방법

  1. 1~n 까지의 숫자를 쓴다
  2. 지워지지 않은 숫자 중 random number *k*를 고른다
  3. **남은 숫자의 개수를 세고,** 지워지지 않은 숫자 *k*를 지우고, 그 숫자를 별도의 list에 쓴다.
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

  

  ```swift
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



### 클래스 메모리 관리 방식에 대해 학습한다. reset() 할때 이전에 만든 카드 객체는 어떻게 되는지 확인한다.

- 이전에 만든 카드 객체는 참조가 해제되므로 ARC에 따라 메모리에서 사라진다

- 하지만 `cards` 에 직접 선언해주고 있기 때문에 메모리 누수가 나지는 않는다

[참고](http://jhyejun.com/blog/memory-management-arc)





#### Xcode Memory Graph Debugger



![스크린샷 2021-02-15 오후 9 14 52](https://user-images.githubusercontent.com/62657991/107946455-64cf7700-6fd4-11eb-91b6-25ea232b6e35.png)

이걸 누르면 Memory Graph Debugger로 진입하게 된다

![스크린샷 2021-02-15 오후 9 16 54](https://user-images.githubusercontent.com/62657991/107946425-600ac300-6fd4-11eb-8ce8-2a657ef8e96a.png)




위 그림에서 검정 선은 strong 레퍼런스를 나타내고, 회색 선은 unknown(weak 또는 strong) 레퍼런스를 나타낸다. 하지만 이 그래프에서는 선택된 객체가 어떤 객체를 가리키고 있는지는 보여주지 않는다.

메모리 그래프 디버거는 간단한 메모리 릭은 자동으로 탐지할 수 있다. 메모리 릭이 발견되면 보라색 `!` 마크로 경고를 띄워주는데 클릭하면 메모리 릭이 일어난 인스턴스를 확인할 수 있다.



하지만 Xcode에서 모든 메모리 릭을 알려주는 것이 아닙니다. 보통 직접 찾아내야 하는 경우가 더 많다.

[참고](https://seizze.github.io/2019/12/20/iOS-메모리-뜯어보기,-메모리-이슈-디버깅하기,-메모리-릭-찾기.html)

[참고2](https://blog.canapio.com/130)

