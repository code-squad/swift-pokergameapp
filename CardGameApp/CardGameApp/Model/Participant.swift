//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Card.Number: Comparable {
    static func < (lhs: Card.Number, rhs: Card.Number) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    func isEqual(plus: Int, other: Card.Number) -> Bool {
        return self.rawValue + plus == other.rawValue
    }
    
    func isEqual(minus: Int, other: Card.Number) -> Bool {
        return self.rawValue - minus == other.rawValue
    }
}

class Participant: CardSearchable {
    let name: String
    private var cards = [Card]()
    var cardsCount: Int {
        return cards.count
    }
    var ranks = [Rank]()
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        cards = [Card]()
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach{ handler($0) }
    }
}

extension Participant {
    
    func updateRanks() {
        var cards = self.cards
        if let updatedCards = checkFourCard(cards: cards) {
            cards = updatedCards
        }
        
        if let updatedCards = checkStraight(cards: cards) {
            cards = updatedCards
        }
        
        if let updatedCards = checkTriple(cards: cards) {
            cards = updatedCards
        }
        
        if let updatedCards = checkPairs(cards: cards) {
            cards = updatedCards
        }
        
        checkOneCard(cards: cards)
    }
    
    private func checkFourCard(cards: [Card]) -> [Card]? {
        if let result = Rank.checkCombinationAndUpdateCards(combination: .fourCard, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .fourCard))
            return result.0
        }
        return nil
    }
    
    private func checkStraight(cards: [Card]) -> [Card]? {
        if let result = Rank.checkCombinationAndUpdateCards(combination: .straight, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .straight))
            return result.0
        }
        return nil
    }
    
    private func checkTriple(cards: [Card] ) -> [Card]? {
        var cards = cards
        if let result = Rank.checkCombinationAndUpdateCards(combination: .triple, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .triple))
            cards = result.0
            if let result = Rank.checkCombinationAndUpdateCards(combination: .triple, cards: cards) {
                ranks.append(Rank(number: result.1, combination: .triple))
                return result.0
            }
            return result.0
        }
        return nil
    }
    
    private func checkPairs(cards: [Card] ) -> [Card]? {
        if let result = Rank.checkCombinationAndUpdateCards(combination: .twoPair, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .twoPair))
            return result.0
        } else if let result = Rank.checkCombinationAndUpdateCards(combination: .onePair, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .onePair))
            return result.0
        }
        return nil
    }
    
    private func checkOneCard(cards: [Card]) {
        if let result = Rank.checkCombinationAndUpdateCards(combination: .oneCard, cards: cards) {
            ranks.append(Rank(number: result.1, combination: .oneCard))
        }
    }
}
