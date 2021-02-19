//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/17.
//
class CardDeck {
    var cards = [Card]()
    
    func makeCards() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func shuffle() {
        for i in 0..<self.count() {
            let randomIndex = Int.random(in: i..<self.count())
            self.cards.swapAt(i, randomIndex)
        }
    }
    
    func reset() {
        self.cards.removeAll()
        makeCards()
    }
    
    func removeOne() -> Card? {
        return self.cards.popLast()
    }
    
    func getCard(newCard: Card) {
        cards.append(newCard)
    }
}
