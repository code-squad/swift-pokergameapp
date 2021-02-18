//
//  Dealer.swift
//  PokerGameApp
//
//  Created by user on 2021/02/17.
//

import Foundation

enum Stud: Int {
    case five = 5
    case seven = 7
}

enum NumberOfPlayers: Int {
    case one = 1, two, three, four
}

class Dealer : Player {
    private var cardDeck: CardDeck
    private var stud:Stud
    
    override init() {
        self.cardDeck = CardDeck()
        self.cardDeck.reset()
        self.cardDeck.shuffle()
        self.stud = .five
    }
    
    func selectStud(_ stud: Stud) {
        self.stud = stud
    }
    
    func distributeCard(_ players: Players) -> Bool {
        for _ in 0..<self.stud.rawValue {
            var tempCardDeck = CardDeck()
            
            for _ in 0..<players.totalPeopleNum {
                if let card = self.cardDeck.removeOne() {
                    tempCardDeck.getOne(card)
                } else {
                    return false
                }
            }
            players.eachPlayersGetCards(tempCardDeck)
        }
        return true
    }
    
    func resetCardDeck() {
        self.cardDeck.reset()
        self.cardDeck.shuffle()
    }
    
    func currentStud() -> String {
        return "\(self.stud.rawValue)"
    }
}
