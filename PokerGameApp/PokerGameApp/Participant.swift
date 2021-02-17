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
    
    func updateMyStack(with cards: [Card]) {
        self.cards = cards
    }
}

class Dealer: Participant, CustomStringConvertible {
    
    private let P = PrintFactory()
    
    private var cardDeck: CardDeck
    
    init(name: Role, cardDeck: CardDeck) {
        self.cardDeck = cardDeck
        super.init(name: name)
    }
    
    func startGame(with rule: PokerGame.Rule, _ seat: PokerGame.Seat) -> [[Card]]? {
        cardDeck.shuffle()
        
        let headCnt = seat.count()
        let cardCnt = rule.cardCount()
        
        let cardCheck = isCardAvailable(for: headCnt, each: cardCnt)
        
        return cardCheck ? cardStacks(for: headCnt, each: cardCnt) : nil
    }
    
    private func isCardAvailable(for headCnt: Int, each cardCnt: Int) -> Bool {
        return cardDeck.count() >= headCnt * cardCnt ? true : false
    }
    
    private func cardStacks(for headCnt: Int, each cardCnt: Int) -> [[Card]]? {
        var stacks = [[Card]]()
        
        for _ in 0..<headCnt {
            if let stack = cardStack(of: cardCnt) {
                stacks.append(stack)
            } else {
                return nil
            }
        }
        return stacks
    }
    
    private func cardStack(of count: Int) -> [Card]? {
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
    
    func deckInfo() -> String {
        P.deckCountInfo(from: cardDeck.count())
    }
    
    func endGame() -> String {
        P.endMessage()
    }
    
    var description: String {
        return "\(name): \(cards ?? [])"
    }
}

class Player: Participant, CustomStringConvertible {
    
    private let number: Int
    
    init(name: Role, number: Int) {
        self.number = number
        super.init(name: name)
    }
    
    var description: String {
        return "\(name) #\(number): \(cards ?? [])"
    }
}
