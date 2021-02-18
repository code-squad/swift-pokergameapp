//
//  Participant.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Participant {
    
    fileprivate let role: Role
    
    enum Role {
        case dealer, player
    }
    
    fileprivate var cards: [Card]
    
    init(name: Role) {
        self.role = name
        cards = []
    }
    
    func updateStack(with cards: [Card]) {
        self.cards = cards
    }
    
    func myName() -> String {
        return ""
    }
    
    func myStack() -> [Card] {
        return cards
    }
}


class Dealer: Participant {
    
    private var cardDeck: CardDeck
    
    init(name: Role, with cardDeck: CardDeck) {
        self.cardDeck = cardDeck
        super.init(name: name)
    }
    
    func handOutCardStacks(for headCnt: Int, each cardCnt: Int) -> [[Card]] {
        
        if !isCardAvailable(for: headCnt, each: cardCnt) {
            cardDeck.reset()
        }
        
        cardDeck.shuffle()
        
        return makeCardStacks(for: headCnt, each: cardCnt)
    }
    
    private func isCardAvailable(for headCnt: Int, each cardCnt: Int) -> Bool {
        return cardDeck.count() >= headCnt * cardCnt ? true : false
    }
    
    private func makeCardStacks(for headCnt: Int, each cardCnt: Int) -> [[Card]] {
        var stacks = [[Card]]()
        
        for _ in 0..<headCnt {
            stacks.append(makeCardStack(of: cardCnt))
        }
        return stacks
    }
    
    private func makeCardStack(of count: Int) -> [Card] {
        var cards = [Card]()
        
        for _ in 0..<count {
            cards.append(cardDeck.removeOne()!)
        }
        return cards
    }

    override func myName() -> String {
        return "\(role)"
    }
}


class Player: Participant {
    
    private let number: Int
    
    init(name: Role, number: Int) {
        self.number = number
        super.init(name: name)
    }
    
    override func myName() -> String {
        return "\(role) #\(number)"
    }
}
