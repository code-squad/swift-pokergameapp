//
//  Deck.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/10.
//  Copyright © 2020 Viet. All rights reserved.
//

import Foundation

struct Deck {
    private var cards = [Card]()
    
    init() {
        self.cards = createAllCards()
    }

    private func createAllCards() -> [Card] {
        return Card.Suit.allCases.flatMap {
            createCards(perSuit: $0)
        }
    }
    
    private func createCards(perSuit suit: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map {
            Card(suit: suit, rank: $0)
        }
    }
    
    /// 갖고 있는 카드 개수를 반환한다.
    var count: Int {
        cards.count
    }
    
    /// 전체 카드를 섞는다.
    mutating func shuffle() {
        cards.shuffle()
    }
    
    /// 카드를 하나 반환하고 목록에서 삭제
    mutating func removeOne() -> Card {
        return cards.removeFirst()
    }
    
    /// 모든 카드를 다시 채워놓는다.
    mutating func reset() {
        self.cards = createAllCards()
    }
}
