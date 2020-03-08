//
//  Ranks.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/05.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Ranks {
    
    private var ranks = [Rank]()
    
    init(cards: [Card]) {
        generateRanks(cards: cards)
    }
    
    private func generateRanks(cards: [Card]) {
        var cards = cards
        
        if let fourCard = isFourCard(cards: cards) {
            ranks.append(Rank(card: fourCard, combination: .fourCard))
            cards = remove(cards: cards, with: fourCard)
        }
        
        if let straights = isStraight(cards: cards) {
            ranks.append(Rank(card: straights.last!, combination: .straight))
            cards = removeStraights(cards: cards, straights: straights)
        }
        
        if let triple = isTriple(cards: cards) {
            ranks.append(Rank(card: triple, combination: .triple))
            cards = remove(cards: cards, with: triple)
            if let tripleCard = isTriple(cards: cards) {
                ranks.append(Rank(card: tripleCard, combination: .triple))
                cards = remove(cards: cards, with: tripleCard)
            }
        }
        
        if let twoPairs = isTwoPair(cards: cards) {
            ranks.append(Rank(card: twoPairs.last!, combination: .twoPair))
            cards = removeTwopairs(cards: cards, twopairs: twoPairs)
        } else if let onePair = isOnePair(cards: cards) {
            ranks.append(Rank(card: onePair, combination: .onePair))
            cards = remove(cards: cards, with: onePair)
        }
        
        if let oneCard = isOneCard(cards: cards) {
            ranks.append(Rank(card: oneCard, combination: .oneCard))
        }
    }
    
}

extension Ranks {
    
    private func generateCards(cards: [Card]) -> [(key: Card, value: Int)] {
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
    
    private func remove(cards: [Card], with card: Card) -> [Card] {
        var cards = cards
        cards.removeAll { (curCard) -> Bool in
            return curCard == card
        }
        return cards
    }
    
}

extension Ranks {
    
    private func isFourCard(cards: [Card]) -> Card? {
        let fourCardsCount = 4
        guard isLonger(count: cards.count, than: fourCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
        let sameCardsCount = 4
        for sameNumberCard in sameNumberCards {
            if sameNumberCard.value == sameCardsCount {
                return sameNumberCard.key
            }
        }
        return nil
    }
    
    private func isStraight(cards: [Card]) -> [Card]? {
        let fiveCardsCount = 5
        guard isLonger(count: cards.count, than: fiveCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
        guard sameNumberCards.count >= fiveCardsCount else {
            return nil
        }
        
        for index in 0 ... sameNumberCards.count - 5 {
            var curCard = sameNumberCards[index].key
            var count = 0
            var straights = [curCard]
            for j in index + 1 ..< sameNumberCards.count {
                let next = sameNumberCards[j].key
                guard curCard.isEqual(other: next, distance: -1) else {
                    break
                }
                straights.append(next)
                curCard = next
                count += 1
            }
            
            if count > 4 {
                return nil
            } else if count == 4 {
                return straights
            }
        }
        return nil
    }
    
    private func removeStraights(cards: [Card], straights : [Card]) -> [Card] {
        var cards = cards
        for straight in straights {
            cards.removeAll { (card) -> Bool in
                straight.isDeepEqual(other: card)
            }
        }
        return cards
    }
    
    private func isTriple(cards: [Card]) -> Card? {
        let threeCardsCount = 3
        guard isLonger(count: cards.count, than: threeCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
        let sameCardsCount = 3
        for num in sameNumberCards {
            if num.value == sameCardsCount {
                return num.key
            }
        }
        return nil
    }
    
    private func isTwoPair(cards: [Card]) -> [Card]? {
        let fourCardsCount = 4
        guard isLonger(count: cards.count, than: fourCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
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
    
    private func removeTwopairs(cards: [Card], twopairs: [Card]) -> [Card] {
         var cards = cards
         cards.removeAll { (card) -> Bool in
             return twopairs.contains(card)
         }
         return cards
     }
    
    private func isOnePair(cards: [Card]) -> Card? {
        let twoCardsCount = 2
        guard isLonger(count: cards.count, than: twoCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
        let sameCardsCount = 2
        for sameNumberCard in sameNumberCards {
            if sameNumberCard.value == sameCardsCount {
                return sameNumberCard.key
            }
        }
        return nil
    }
    
    private func isOneCard(cards: [Card]) -> Card? {
        let oneCardsCount = 1
        guard isLonger(count: cards.count, than: oneCardsCount) else {
            return nil
        }
        
        let sameNumberCards = generateCards(cards: cards)
        return sameNumberCards.last!.key
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


