//
//  Participant.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Participant {
    
    fileprivate let name: Role
    
    enum Role: CustomStringConvertible {
        case dealer
        case player
        
        var description: String {
            switch self {
            case .dealer:
                return "딜러"
            case .player:
                return "플레이어"
            }
        }
    }
    
    fileprivate var cards: [Card]?
    
    init(name: Role) {
        self.name = name
    }
    
    func updateStack(with cards: [Card]) {
        self.cards = cards
    }
    
    func myName() -> String {
        return ""
    }
}


class Dealer: Participant {
    
    private var cardDeck: CardDeck
    private var infoBoard: InfoBoard
    
    init(name: Role, with cardDeck: CardDeck, _ infoBoard: InfoBoard) {
        self.cardDeck = cardDeck
        self.infoBoard = infoBoard
        super.init(name: name)
    }
    
    func handOutCardStacks(for headCnt: Int, each cardCnt: Int) -> [[Card]]? {
        cardDeck.shuffle()
        
        guard isCardAvailable(for: headCnt, each: cardCnt) else {
            finishGame()
            return nil
        }
        
        let newCardStacks = makeCardStacks(for: headCnt, each: cardCnt)
        
        updateCardCount(to: cardDeck.count())
        
        return newCardStacks
    }
    
    private func isCardAvailable(for headCnt: Int, each cardCnt: Int) -> Bool {
        return cardDeck.count() >= headCnt * cardCnt ? true : false
    }
    
    private func makeCardStacks(for headCnt: Int, each cardCnt: Int) -> [[Card]]? {
        var stacks = [[Card]]()
        
        for _ in 0..<headCnt {
            if let stack = makeCardStack(of: cardCnt) {
                stacks.append(stack)
            } else {
                return nil
            }
        }
        return stacks
    }
    
    private func makeCardStack(of count: Int) -> [Card]? {
        var cards = [Card]()
        
        for _ in 0..<count {
            if let card = cardDeck.removeOne() {
                cards.append(card)
            } else {
                return nil
            }
        }
        return cards
    }
    
    private func updateCardCount(to currentCount: Int) {
        infoBoard.cardCount = currentCount
    }
    
    private func finishGame() {
        infoBoard.isGameFinished = true
    }
    
    override func myName() -> String {
        return "\(name)"
    }
}


class Player: Participant {
    
    private let number: Int
    
    init(name: Role, number: Int) {
        self.number = number
        super.init(name: name)
    }
    
    override func myName() -> String {
        return "\(name) #\(number)"
    }
}
