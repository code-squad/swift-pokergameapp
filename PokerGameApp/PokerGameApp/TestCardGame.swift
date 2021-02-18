//
//  TestCardGame.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/17.
//

import Foundation

struct TestCardGame {
    private var cardDeck = CardDeck(empty: false)

    init() {
        reset()
    }
    
    public var count: Int {
        return cardDeck.count
    }
    
    //Knuth Shuffle 알고리즘
    public mutating func shuffle() {
        cardDeck.shuffle()
        print("카드 섞기")
        print("총 \(cardDeck.count)장의 카드를 섞었습니다.")
    }
    
    public mutating func popCard() -> Card? {
        guard let pickedCard = cardDeck.popCard() else {
            print("카드 수가 모잘라 더이상 뽑을 수 없습니다.")
            return nil
        }
        print("> 카드 하나 뽑기")
        print(pickedCard)
        print("총 \(cardDeck.count)장의 카드가 남았습니다.")
        return pickedCard
    }
 
    public mutating func reset() {
        cardDeck.reset()
        print("> 카드 초기화")
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count)장의 카드가 남았습니다.")
    }
    
    public mutating func testGame() {
        count
        shuffle()
        popCard()
        reset()
        popCard()
        count

        for _ in 0...52 {
            popCard()
        }
    }
}
