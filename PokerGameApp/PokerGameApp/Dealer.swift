//
//  Dealer.swift
//  PokerGameApp
//
//  Created by user on 2021/02/17.
//

import Foundation

enum Stud: Int, CustomStringConvertible, CaseIterable {
    case five = 5
    case seven = 7
    
    var description: String {
        return "\(self.rawValue) Cards"
    }
    
    static var studType: [Stud] {
        return [.five, .seven]
    }
}

enum NumberOfPlayers: Int, CustomStringConvertible, CaseIterable {
    case two = 2, three, four
    
    var description: String {
        return "\(self.rawValue)명"
    }
    
    static var playerType: [NumberOfPlayers] {
        return [.two, .three, .four]
    }
}


class Player : CustomStringConvertible {
    var myCard: CardDeck
    
    var description: String {
        return "\(self.myCard)"
    }
    
    init() {
        myCard = CardDeck()
    }
    
    func getOne(_ card: PokerCard) {
        self.myCard.getOne(card)
    }
    
    func dropAll() {
        self.myCard.dropAll()
    }
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
    
    func distributeCards(_ players: Players) -> Bool {
        for _ in 0..<self.stud.rawValue {
            var tempCardDeck = CardDeck()
            
            for _ in 0..<players.totalPeopleNum {
                if let card = self.cardDeck.removeOne() {
                    tempCardDeck.getOne(card)
                } else {
                    return false
                }
            }
            players.distributeEachCard(with: tempCardDeck)
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
