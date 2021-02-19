//
//  Players.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Player {
    private var hand : Deck
    
    init() {
        self.hand = Deck.init()
    }
    
    func showHand() -> [String] {
        return hand.allCards()
    }
    
    func showHandAsString() -> String {
        var returnString = showHand().reduce("", {
            return $0 + "," + $1
        })
        returnString.removeFirst()
        return returnString
    }
    
    func receiveCard(with newCard : PlayingCard) {
        self.hand.addingNewCard(with: newCard)
    }
    
    func resetSelf() {
        self.hand = Deck.init()
    }
    
    func printSelf() {
        print("[\(showHandAsString())]")
    }
}
