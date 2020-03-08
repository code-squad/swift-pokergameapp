//
//  Deck.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Deck {
    
    private static let singletonInitCards: [Card] = {
        var cards = [Card]()
        for suit in Card.Suit.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(
                    suit: suit,
                    number: number))
            }
        }
        return cards
    }()
    
    private var cards: [Card]!
    var count: Int {
        return cards.count
    }
    
    init() {
        self.cards = Deck.singletonInitCards
    }
    
    func shuffle<G: RandomNumberGenerator>(using generator: inout G) {
        cards = cards.shuffled(using: &generator)
    }
    
    @discardableResult
    func removeOne() -> Card? {
        let none = 0
        guard count != none else {
            return nil
        }
        return cards.removeFirst()
    }
    
    func reset() {
        cards = Deck.singletonInitCards
    }
    
}

extension Deck: Equatable {
    
    public static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }
    
}

extension Deck: CardSearchable {
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach { handler($0) }
    }
    
}
