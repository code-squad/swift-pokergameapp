//
//  Rank.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Rank: Comparable {
    
    let card: Card
    let combination: Combination
    
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        return (lhs.combination == rhs.combination) &&
            (lhs.card == rhs.card)
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        if lhs.combination == rhs.combination {
            return lhs.card < rhs.card
        }
        return lhs.combination < rhs.combination
    }
    
}

extension Rank {
    
    enum Combination: Int, CaseIterable, Comparable {
        case oneCard = 0
        case onePair
        case twoPair
        case triple
        case straight
        case fourCard
        
        static func < (lhs: Combination, rhs: Combination) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func isFourCard(cards: [Card]) -> Card? {
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
        
        static func isStraight(cards: [Card]) -> Card? {
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
        
        static func isTriple(cards: [Card]) -> Card? {
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
        
        static func isTwoPair(cards: [Card]) -> [Card]? {
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
        
        static func isOnePair(cards: [Card]) -> Card? {
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
        
        static func isOneCard(cards: [Card]) -> Card? {
            let oneCardsCount = 1
            guard isLonger(count: cards.count, than: oneCardsCount) else {
                return nil
            }
            
            let sameNumberCards = generateNums(cards: cards)
            return sameNumberCards.last!.key
        }
        
        private static func isLonger(count: Int, than size: Int) -> Bool {
            return count >= size
        }
        
        private static func generateNums(cards: [Card]) -> [(key: Card, value: Int)] {
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
    }
    
}


extension Rank {
    
    static func checkCombiAndGenerateRanks(with cards: [Card]) -> [Rank] {
        var cards = cards
        var ranks = [Rank]()
        
        if let result = Rank.checkCombinationAndUpdateCards(combination: .fourCard, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .fourCard))
            cards = result.0
        }
        
        if let result = Rank.checkCombinationAndUpdateCards(combination: .straight, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .straight))
            cards = result.0
        }
        
        if let result = Rank.checkCombinationAndUpdateCards(combination: .triple, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .triple))
            cards = result.0
            if let result = Rank.checkCombinationAndUpdateCards(combination: .triple, cards: cards) {
                ranks.append(Rank(card: result.1, combination: .triple))
                cards = result.0
            }
        }
        
        if let result = Rank.checkCombinationAndUpdateCards(combination: .twoPair, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .twoPair))
            cards = result.0
        } else if let result = Rank.checkCombinationAndUpdateCards(combination: .onePair, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .onePair))
            cards = result.0
        }
        
        if let result = Rank.checkCombinationAndUpdateCards(combination: .oneCard, cards: cards) {
            ranks.append(Rank(card: result.1, combination: .oneCard))
        }
        
        return ranks
    }
    
    static func checkCombinationAndUpdateCards(combination: Rank.Combination, cards: [Card]) ->  ([Card],Card)? {
        switch combination {
        case .fourCard:
            return checkFourCardAndUpdateCards(cards: cards)
        case .straight:
            return checkStraightAndUpdateCards(cards: cards)
        case .triple:
            return checkTripleAndUpdateCards(cards: cards)
        case .twoPair:
            return checkTwoPairAndUpdateCards(cards: cards)
        case .onePair:
            return checkOnePairAndUpdateCards(cards: cards)
        case .oneCard:
            return checkOneCard(cards: cards)
        }
    }
    
    private static func checkFourCardAndUpdateCards(cards: [Card]) -> ([Card],Card)? {
        var cards = cards
        if let fourCard = Rank.Combination.isFourCard(cards: cards) {
            cards.removeAll { (card) -> Bool in
                return card == fourCard
            }
            return (cards,fourCard)
        }
        return nil
    }
    
    private static func checkStraightAndUpdateCards(cards: [Card]) -> ([Card],Card)? {
        var cards = cards
        if let maxCard = Rank.Combination.isStraight(cards: cards) {
            cards = removeCardsForStraight(cards: cards, maxCard: maxCard)
            return (cards,maxCard)
        }
        return nil
    }
    
    private static func removeCardsForStraight(cards: [Card], maxCard : Card) -> [Card] {
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
    
    private static func checkTripleAndUpdateCards(cards: [Card]) -> ([Card],Card)? {
        var cards = cards
        if let tripleCard = Rank.Combination.isTriple(cards: cards) {
            cards.removeAll { (card) -> Bool in
                return card == tripleCard
            }
            return (cards,tripleCard)
        }
        return nil
    }
    
    private static func checkTwoPairAndUpdateCards(cards: [Card]) -> ([Card],Card)? {
        var cards = cards
        if let twoPairCards = Rank.Combination.isTwoPair(cards: cards) {
            cards.removeAll { (card) -> Bool in
                return twoPairCards.contains(card)
            }
            return (cards,twoPairCards.last!)
        }
        return nil
    }
    
    private static func checkOnePairAndUpdateCards(cards: [Card]) -> ([Card],Card)? {
        var cards = cards
        if let onePairCard = Rank.Combination.isOnePair(cards: cards) {
            cards.removeAll { (card) -> Bool in
                return card == onePairCard
            }
            return (cards,onePairCard)
        }
        return nil
    }
    
    private static func checkOneCard(cards: [Card]) -> ([Card],Card)? {
        if let oneCard = Rank.Combination.isOneCard(cards: cards) {
            return ([Card](),oneCard)
        }
        return nil
    }
    
}
