//
//  testCardDeck.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/18.
//

import Foundation

class testCardDeck {
    var cardDeck = CardDeck()
    
    private func testmakeCard() {
        print("> 카드 초기화")
        cardDeck.makeCards()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count())개의 카드가 있습니다.\n")
    }
    
    private func testShuffle() {
        print("> 카드 섞기")
        cardDeck.shuffle()
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.\n")
    }
    
    private func testRemoveOne() {
        print("> 카드 하나 뽑기")
        if let card = cardDeck.removeOne() {
            print(card)
            print("총 \(cardDeck.count())개의 카드가 있습니다.\n")
        } else {
            print("카드가 없습니다.\n")
        }
    }
    
    func process(){
        testmakeCard()
        testShuffle()
        for _ in 0..<5 {
            testRemoveOne()
        }
    }
}
