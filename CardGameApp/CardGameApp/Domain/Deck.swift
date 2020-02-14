//
//  Deck.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Searchable {
    func search(handler : (Card) -> ())
}

struct Deck {
    private var cards : [Card]!
    var count : Int {
        return cards.count
    }
    
    init() {
        self.cards = initCards()
    }
    
    private func initCards() -> [Card] {
        var cards = [Card]()
        for suit in Card.Suit.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(
                    suit: suit,
                    number: number))
            }
        }
        return cards
    }
    
    mutating func shuffle<G : RandomNumberGenerator>(using generator : inout G)  {
        cards = cards.shuffled(using: &generator)
    }
    
    @discardableResult
    mutating func removeOne() throws -> Card {
        let none = 0
        guard count != none else {
            throw DeckError.indexOutOfRangeError
        }
        
        let indexFirstCard = 0
        return cards.remove(at: indexFirstCard)
    }
    
    mutating func reset() {
        cards = initCards()
    }
}

extension Deck : Equatable {
    public static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }
}

extension Deck : Searchable {
    func search(handler: (Card) -> ()) {
        for card in cards {
            handler(card)
        }
    }
}

enum DeckError : Error {
    case indexOutOfRangeError
}
