//
//  Players.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Player : CustomStringConvertible {
    
    var description: String {
        return "\(name) : \(hand)"
    }
    
    private var hand : Deck
    private let name : String
    
    init(name : String) {
        self.hand = Deck.init()
        self.name = name
    }
    
    func receiveCard(with newCard : PlayingCard) {
        self.hand.addingNewCard(with: newCard)
    }
    
    func resetSelf() {
        self.hand = Deck.init()
    }
    
    func showInfo(do closure : ((Deck,String) -> Void)) {
        closure(hand,name)
    }
}
