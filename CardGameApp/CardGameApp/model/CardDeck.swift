//
//  CardDeck.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/13.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

struct CardDeck {
    // 카드덱
    private var deck = [Card]()
    
    init() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    // 가지고 있는 카드 개수 반환
    func count() -> Int{
        return deck.count
    }
    
    // 전체 카드 랜덤하게 섞기
    // 값타입이라 변경할 수 없지만 mutating을 붙여 프로퍼티값을 변경해버린다.
    mutating func shuffle() {
        self.deck.shuffle()
    }
    
    // 카드하나 뽑기
    // 하나 랜덤으로 뽑고 deck에서 제거 -> Equtable protocol 사용
    mutating func removeOne() -> Card {
        let pickCard = self.deck.removeFirst()
        return pickCard
    }
    
    //카드리셋
    mutating func reset() {
        self.deck = CardDeck().deck
    }
}
