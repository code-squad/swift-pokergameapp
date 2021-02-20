//
//  Deck.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/18.
//

import Foundation

struct Deck : CustomStringConvertible {
    
    var description: String {
        return "\(cards)"
    }
    
    enum errors : Error {
        case noMoreCardError
    }
    
    private var cards : [PlayingCard]
    
    init() {
        self.cards = []
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    mutating func shuffle() {
        for index in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: 0..<cards.count)
            cards.swapAt(index, randomIndex)
        }
    }
    
    ///removeOne 기능
    mutating func popOneCard() throws -> PlayingCard {
        guard let returnCard = cards.popLast() else {
            throw Deck.errors.noMoreCardError
        }
        return returnCard
    }
    
    mutating func removeDeck() {
        self.cards.removeAll()
    }
    
    mutating func newDeck() {
        self.cards.removeAll()
        self.cards = { () -> [PlayingCard] in
            var initDeck = [PlayingCard]()
            for suit in Suits.allCases {
                for number in Rank.allCases {
                    initDeck.append(PlayingCard.init(suit: suit, number: number))
                }
            }
            return initDeck
        }()
    }
    
    mutating func addingNewCard(with newCard : PlayingCard) {
        self.cards.append(newCard)
    }
}
