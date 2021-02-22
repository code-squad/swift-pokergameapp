//
//  Participant.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

protocol Participant {
    
    var role: String { get }
    var cards: [Card] { get }
    
    func updateStack(with cards: [Card])
    func myName() -> String
    func myStack() -> [Card]
    
}

class Dealer: Participant {
    
    let role: String
    var cards: [Card]
    
    private var cardDeck: CardDeck
    
    init(with cardDeck: CardDeck) {
        role = "Dealer"
        cards = []
        self.cardDeck = cardDeck
    }
    
    func updateStack(with cards: [Card]) {
        self.cards = cards
    }

    func myName() -> String {
        return role
    }
    
    func myStack() -> [Card] {
        return cards
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
}


class Player: Participant {
    
    let role: String
    var cards: [Card]
    
    private let number: Int
    
    init(number: Int) {
        role = "Player"
        cards = []
        self.number = number
    }
    
    func updateStack(with cards: [Card]) {
        self.cards = cards
    }
    
    func myName() -> String {
        return "\(role) #\(number)"
    }
    
    func myStack() -> [Card] {
        return cards
    }
}
