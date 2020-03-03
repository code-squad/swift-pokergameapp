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
        if let number = Rank.Combination.isFourCard(cards: cards) {
            ranks.append(Rank(number: number, combination: .fourCard))
            cards.removeAll { (card) -> Bool in
                return card.number == number
            }
            return cards
        }
        return nil
    }
    
    private func checkStraightAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let number = Rank.Combination.isStraight(cards: cards) {
            ranks.append(Rank(number: number, combination: .straight))
            cards = removeCardsForStraight(cards: cards, number: number)
            return cards
        }
        return nil
    }
    
    private func removeCardsForStraight(cards: [Card], number : Card.Number) -> [Card] {
        var isFirst = false
        var isSecond = false
        var isThird = false
        var isFourth = false
        var isFifth = false
        var newCards = [Card]()
        for card in cards {
            if number.isEqual(minus: 4, other: card.number), !isFirst {
                isFirst = true
            } else if number.isEqual(minus: 3, other: card.number), !isSecond {
                isSecond = true
            } else if number.isEqual(minus: 2, other: card.number), !isThird {
                isThird = true
            } else if number.isEqual(minus: 1, other: card.number), !isFourth {
                isFourth = true
            } else if number.isEqual(minus: 0, other: card.number), !isFifth {
                isFifth = true
            } else {
                newCards.append(card)
            }
        }
        return newCards
    }
    
    private func checkTripleAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let number = Rank.Combination.isTriple(cards: cards) {
            ranks.append(Rank(number: number, combination: .triple))
            cards.removeAll { (card) -> Bool in
                return card.number == number
            }
            return cards
        }
        return nil
    }
    
    private func checkTwoPairAndUpdateCards(cards: [Card]) -> Bool {
        if let number = Rank.Combination.isTwoPair(cards: cards) {
            ranks.append(Rank(number: number, combination: .twoPair))
            return true
        }
        return false
    }
    
    private func checkOnePairAndUpdateCards(cards: [Card]) -> Bool {
        if let number = Rank.Combination.isOnePair(cards: cards) {
            ranks.append(Rank(number: number, combination: .onePair))
            return true
        }
        return false
    }
    
}
