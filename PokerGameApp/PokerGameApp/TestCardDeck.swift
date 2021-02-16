//
//  TestCardDeck.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/16.
//

import Foundation

struct TestCardDeck {
    var deck = CardDeck()
    
    init() {
        print("카드 전체를 초기화했습니다.")
        print("총 \(deck.count)장의 카드가 있습니다.")
    }
    
    mutating func shuffle() {
        deck.shuffle()
        print("전체 \(deck.count)장의 카드를 섞었습니다.")
    }
    
    mutating func pop() {
        let card = deck.removeOne()
        print(card)
        print("총 \(deck.count)장의 카드가 남아있습니다.")
    }
}
