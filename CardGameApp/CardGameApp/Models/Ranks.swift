//
//  Ranks.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/05.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Ranks {
    
    private func generateNums(cards: [Card]) -> [(key: Card, value: Int)] {
        var sameNumberCards = [Card:Int]()
        for index in 0 ..< cards.count - 1 {
            let curCard = cards[index]
            guard !sameNumberCards.keys.contains(curCard) else {
                continue
            }
            
            var count = 1
            for j in index + 1 ..< cards.count {
                if curCard == cards[j] {
                    count += 1
                }
            }
            sameNumberCards[curCard] = count
        }
        
        if !sameNumberCards.keys.contains(cards.last!) {
            sameNumberCards[cards.last!] = 1
        }
        
        return sameNumberCards.sorted {
            $0.0 < $1.0
        }
    }
    
    private func isLonger(count: Int, than size: Int) -> Bool {
           return count >= size
       }
       
}

extension Ranks {
    
    private func checkFourCardAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let fourCard = isFourCard(cards: cards) {
            ranks.append(Rank(card: fourCard, combination: .fourCard))
            cards.removeAll { (card) -> Bool in
                return card == fourCard
            }
            return cards
        }
        return nil
    }
    
    private func isFourCard(cards: [Card]) -> Card? {
        let fourCardsCount = 4
        guard isLonger(count: cards.count, than: fourCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateNums(cards: cards)
        let sameCardsCount = 4
        for sameNumberCard in sameNumberCards {
            if sameNumberCard.value == sameCardsCount {
                return sameNumberCard.key
            }
        }
        return nil
    }
    
    private func checkStraightAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let maxCard = isStraight(cards: cards) {
            ranks.append(Rank(card: maxCard, combination: .straight))
            cards = removeCardsForStraight(cards: cards, maxCard: maxCard)
            return cards
        }
        return nil
    }
    
    private func isStraight(cards: [Card]) -> Card? {
        let fiveCardsCount = 5
        guard isLonger(count: cards.count, than: fiveCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateNums(cards: cards)
        guard sameNumberCards.count >= fiveCardsCount else {
            return nil
        }
        
        for index in 0 ... sameNumberCards.count - 5 {
            var curCard = sameNumberCards[index].key
            var count = 0
            for j in index + 1 ..< sameNumberCards.count {
                let next = sameNumberCards[j].key
                guard curCard.isEqual(other: next, distance: -1) else {
                    break
                }
                curCard = next
                count += 1
            }
            if count > 4 {
                return nil
            } else if count == 4 {
                return curCard
            }
        }
        return nil
    }
    
    private func removeCardsForStraight(cards: [Card], maxCard : Card) -> [Card] {
        var isFirst = false
        var isSecond = false
        var isThird = false
        var isFourth = false
        var isFifth = false
        var newCards = [Card]()
        for card in cards {
            if maxCard.isEqual(other: card, distance: 4), !isFirst {
                isFirst = true
            } else if maxCard.isEqual(other: card, distance: 3), !isSecond {
                isSecond = true
            } else if maxCard.isEqual(other: card, distance: 2), !isThird {
                isThird = true
            } else if maxCard.isEqual(other: card, distance: 1), !isFourth {
                isFourth = true
            } else if maxCard.isEqual(other: card, distance: 0), !isFifth {
                isFifth = true
            } else {
                newCards.append(card)
            }
        }
        return newCards
    }
    
    private func checkTripleAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let tripleCard = isTriple(cards: cards) {
            ranks.append(Rank(card: tripleCard, combination: .triple))
            cards.removeAll { (card) -> Bool in
                return card == tripleCard
            }
            return cards
        }
        return nil
    }
    
    private func isTriple(cards: [Card]) -> Card? {
         let threeCardsCount = 3
         guard isLonger(count: cards.count, than: threeCardsCount) else {
             return nil
         }
         
         let sameNumberCards = generateNums(cards: cards)
         let sameCardsCount = 3
         for num in sameNumberCards {
             if num.value == sameCardsCount {
                 return num.key
             }
         }
         return nil
     }
    
    private func checkTwoPairAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let twoPairCards = isTwoPair(cards: cards) {
            ranks.append(Rank(card: twoPairCards.last!, combination: .twoPair))
            cards.removeAll { (card) -> Bool in
                return twoPairCards.contains(card)
            }
            return cards
        }
        return nil
    }
    
    
    private func isTwoPair(cards: [Card]) -> [Card]? {
        let fourCardsCount = 4
        guard isLonger(count: cards.count, than: fourCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateNums(cards: cards)
        let sameCardsCount = 2
        var count = 0
        var twoPairCards = [Card]()
        for num in sameNumberCards {
            if num.value == sameCardsCount {
                twoPairCards.append(num.key)
                count += 1
            }
        }
        
        if count >= 2 {
            return twoPairCards
        }
        return nil
    }
    
    private func checkOnePairAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        if let onePairCard = isOnePair(cards: cards) {
            ranks.append(Rank(card: onePairCard, combination: .onePair))
            cards.removeAll { (card) -> Bool in
                return card == onePairCard
            }
            return cards
        }
        return nil
    }
    
    private func isOnePair(cards: [Card]) -> Card? {
        let twoCardsCount = 2
        guard isLonger(count: cards.count, than: twoCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateNums(cards: cards)
        let sameCardsCount = 2
        for sameNumberCard in sameNumberCards {
            if sameNumberCard.value == sameCardsCount {
                return sameNumberCard.key
            }
        }
        return nil
    }
    
    
    private func checkOneCard(cards: [Card]) {
        if let oneCard = isOneCard(cards: cards) {
            ranks.append(Rank(card: oneCard, combination: .oneCard))
        }
    }
    
    private func isOneCard(cards: [Card]) -> Card? {
        let oneCardsCount = 1
        guard isLonger(count: cards.count, than: oneCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateNums(cards: cards)
        return sameNumberCards.last!.key
    }
}

class Ranks {
    private var ranks = [Rank]()
    
    init(cards: [Card]) {
        generateRanks(cards: cards)
    }
    
    private func generateRanks(cards: [Card]) {
        var cards = cards
        
        if let result = checkFourCardAndUpdateCards(cards: cards) {
            cards = result
        }
        
        if let result = checkStraightAndUpdateCards(cards: cards) {
            cards = result
        }
        
        if let result = checkTripleAndUpdateCards(cards: cards) {
            cards = result
            if let result = checkTripleAndUpdateCards(cards: cards) {
                cards = result
            }
        }
        
        if let result = checkTwoPairAndUpdateCards(cards: cards) {
            cards = result
        } else if let result = checkOnePairAndUpdateCards(cards: cards) {
            cards = result
        }
        checkOneCard(cards: cards)
    }
}

extension Ranks: Comparable {
    
    static func == (lhs: Ranks, rhs: Ranks) -> Bool {
        guard lhs.ranks.count == rhs.ranks.count else {
            return false
        }
        
        for index in 0 ..< lhs.ranks.count {
            guard lhs.ranks[index] == rhs.ranks[index] else {
                return false
            }
        }
        return true
    }
    
    static func < (lhs: Ranks, rhs: Ranks) -> Bool {
        
        let min = lhs.ranks.count > rhs.ranks.count ? lhs.ranks.count : rhs.ranks.count
        for index in 0 ..< min {
            if lhs.ranks[index].combination != rhs.ranks[index].combination {
                return lhs.ranks[index].combination < rhs.ranks[index].combination
            }
        }
        
        if lhs.ranks.count > min {
            return false
        }
        
        if rhs.ranks.count > min {
            return true
        }
        
        for index in 0 ..< min {
            if lhs.ranks[index].card != rhs.ranks[index].card {
                return lhs.ranks[index].card < rhs.ranks[index].card
            }
        }
        return false
    }
}


