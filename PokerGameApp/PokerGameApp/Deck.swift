//
//  Deck.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/18.
//

import Foundation

struct Deck  {
    
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
        return self.cards.count
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
    
    func printCards() {
        if self.count() == 0 {
            print("Deck is empty")
            return
        }
        for index in 0..<self.count() {
            print(cards[index], terminator: " ")
        }
        print("")
    }
}
