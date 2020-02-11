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
    private var poppedCards = [Card]()
    
    init(cards: [Card]) {
        self.cards = cards
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
    mutating func removeOne() -> Card? {
        guard let card = cards.popLast() else {
            return nil
        }
        poppedCards.append(card)
        
        return card
    }
    
    /// 모든 카드를 다시 채워놓는다.
    mutating func reset() {
        self.cards += poppedCards
        self.poppedCards.removeAll()
    }
}

struct DeckFactory {
    static func create() -> Deck {
        return Deck(cards: createAllCards())
    }
    
    static func createAllCards() -> [Card] {
        return Card.Suit.allCases.flatMap {
            createCards(per: $0)
        }
    }
    
    static func createCards(per suit: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map {
            Card(suit: suit, rank: $0)
        }
    }
}
