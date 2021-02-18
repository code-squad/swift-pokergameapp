//
//  Deck.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/18.
//

import Foundation

struct Deck : CustomStringConvertible {
    var description: String  {
        var returnString = String()
        for index in self.cards {
            returnString += index.description + " "
        }
        return returnString
    }
    
    private var cards : [PlayingCard]
    private let firstState : [PlayingCard]
    
    init() {
        self.cards = { () -> [PlayingCard] in
            var initDeck = [PlayingCard]()
            for suit in Suits.allCases {
                for number in Rank.allCases {
                    initDeck.append(PlayingCard.init(suit: suit, number: number))
                }
            }
            return initDeck
        }()
        self.firstState = self.cards
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    ///removeOne 기능
    mutating func popOneCard() throws -> PlayingCard {
        guard let returnCard = cards.popLast() else {
            throw TroubleShooter.errors.noMoreCardError
        }
        return returnCard
    }
    
    mutating func reset() {
        self.cards = self.firstState
    }
}
