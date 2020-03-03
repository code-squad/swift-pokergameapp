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
    var ranks = [Rank.Combination]()
    
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
    
    func updateRanks() {
        var cards = self.cards
        if let updatedCards = checkFourCardAndUpdateCards(cards: cards) {
            cards = updatedCards
        }
        if let updatedCards = checkStraightAndUpdateCards(cards: cards) {
            cards = updatedCards
        }
        if let updatedCards = checkTripleAndUpdateCards(cards: cards) {
            cards = updatedCards
            if let updatedCards = checkTripleAndUpdateCards(cards: cards) {
                cards = updatedCards
            }
        }
        if checkTwoPairAndUpdateCards(cards: cards) {
            return
        } else if checkOnePairAndUpdateCards(cards: cards) {
            return
        }
    }
    
    private func checkFourCardAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let num = Rank.Combination.isFourCard(cards: cards) {
            ranks.append(.fourCard)
            cards.removeAll { (card) -> Bool in
                return card.number == num
            }
            return cards
        }
        return nil
    }
    
    private func checkStraightAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let num = Rank.Combination.isStraight(cards: cards) {
            ranks.append(.straight)
            cards = removeCardsForStraight(cards: cards, num: num)
            return cards
        }
        return nil
    }
    
    private func removeCardsForStraight(cards: [Card], num : Card.Number) -> [Card] {
        var isFirst = false
        var isSecond = false
        var isThird = false
        var isFourth = false
        var isFifth = false
        var newCards = [Card]()
        for card in cards {
            if num.isEqual(minus: 4, other: card.number), !isFirst {
                isFirst = true
            } else if num.isEqual(minus: 3, other: card.number), !isSecond {
                isSecond = true
            } else if num.isEqual(minus: 2, other: card.number), !isThird {
                isThird = true
            } else if num.isEqual(minus: 1, other: card.number), !isFourth {
                isFourth = true
            } else if num.isEqual(minus: 0, other: card.number), !isFifth {
                isFifth = true
            } else {
                newCards.append(card)
            }
        }
        return newCards
    }
    
    private func checkTripleAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let num = Rank.Combination.isTriple(cards: cards) {
            ranks.append(.triple)
            cards.removeAll { (card) -> Bool in
                return card.number == num
            }
            return cards
        }
        return nil
    }
    
    private func checkTwoPairAndUpdateCards(cards: [Card]) -> Bool {
        if let num = Rank.Combination.isTwoPair(cards: cards) {
            ranks.append(.twoPair)
            return true
        }
        return false
    }
    
    private func checkOnePairAndUpdateCards(cards: [Card]) -> Bool {
        if let num = Rank.Combination.isOnePair(cards: cards) {
            ranks.append(.onePair)
            return true
        }
        return false
    }
    
}
