//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/17.
//
struct CardDeck {
    private var cards = [Card]()
    
    mutating func createCards() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func count() -> Int {
        return self.cards.count
    }
    
    mutating func shuffle() {
        for i in 0..<self.count() {
            let randomIndex = Int.random(in: i..<self.count())
            self.cards.swapAt(i, randomIndex)
        }
    }
    
    mutating func reset() {
        self.cards = []
        createCards()
    }
    
    mutating func removeOne() -> Card? {
        return self.cards.popLast()
    }
}
