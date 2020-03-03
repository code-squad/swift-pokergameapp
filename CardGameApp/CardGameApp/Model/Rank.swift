//
//  Rank.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Rank: Comparable {
    
    let number: Card.Number
    let combination: Combination
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        if lhs.combination == rhs.combination {
            return lhs.number < rhs.number
        }
        return lhs.combination < rhs.combination
    }
}

extension Rank {
    
    enum Combination: Int, CaseIterable, Comparable {
        case oneCard = 0
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case straight = 7
        case fourCard = 9
        
        static func < (lhs: Combination, rhs: Combination) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func isFourCard(cards: [Card]) -> Card.Number? {
            let fourCardsCount = 4
            guard cards.count >= fourCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            let sameCardsCount = 4
            for num in nums {
                if num.value == sameCardsCount {
                    return num.key
                }
            }
            return nil
        }
        
        static func isStraight(cards: [Card]) -> Card.Number? {
            let fiveCardsCount = 5
            guard cards.count >= fiveCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            guard nums.count >= fiveCardsCount else {
                return nil
            }
            
            for index in 0 ... nums.count - 5 {
                var curNum = nums[index].key
                var count = 0
                for j in index + 1 ..< nums.count {
                    let next = nums[j].key
                    guard curNum.isEqual(plus: 1, other: next) else {
                        break
                    }
                    curNum = next
                    count += 1
                }
                if count > 4 {
                    return nil
                } else if count == 4 {
                    return curNum
                }
            }
            return nil
        }
        
        static func isTriple(cards: [Card]) -> Card.Number? {
            let threeCardsCount = 3
            guard cards.count >= threeCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            let sameCardsCount = 3
            for num in nums {
                if num.value == sameCardsCount {
                    return num.key
                }
            }
            return nil
        }
        
        static func isTwoPair(cards: [Card]) -> [Card.Number]? {
            let fourCardsCount = 4
            guard cards.count >= fourCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            let sameCardsCount = 2
            
            var count = 0
            var numbers = [Card.Number]()
            for num in nums {
                if num.value == sameCardsCount {
                    numbers.append(num.key)
                    count += 1
                }
            }
            
            if count >= 2 {
                return numbers
            }
            return nil
        }
        
        static func isOnePair(cards: [Card]) -> Card.Number? {
            let twoCardsCount = 2
            guard cards.count >= twoCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            let sameCardsCount = 2
            for num in nums {
                if num.value == sameCardsCount {
                    return num.key
                }
            }
            return nil
        }
        
        static func isOneCard(cards: [Card]) -> Card.Number? {
            let noCardsCount = 0
            guard cards.count != noCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            return nums.last!.key
        }
        
        private static func generateNums(cards: [Card]) -> [(key: Card.Number, value: Int)] {
            var nums = [Card.Number:Int]()
            for index in 0 ..< cards.count - 1 {
                let curNum = cards[index].number
                guard !nums.keys.contains(curNum) else {
                    continue
                }
                
                var count = 1
                for j in index + 1 ..< cards.count {
                    if curNum == cards[j].number {
                        count += 1
                    }
                }
                nums[curNum] = count
            }
            if !nums.keys.contains(cards.last!.number) {
                nums[cards.last!.number] = 1
            }
            
            return nums.sorted {
                $0.0 < $1.0
            }
        }
    }
    
}


extension Rank {
    
    static func checkCombinationAndUpdateCards(type: Rank.Combination, cards: [Card], ranks: [Rank]) ->  ([Card]?,[Rank])? {
        switch type {
        case .fourCard:
            return checkFourCardAndUpdateCards(cards: cards, ranks: ranks)
        case .straight:
            return checkStraightAndUpdateCards(cards: cards, ranks: ranks)
        case .triple:
            return checkTripleAndUpdateCards(cards: cards, ranks: ranks)
        case .twoPair:
            return checkTwoPairAndUpdateCards(cards: cards, ranks: ranks)
        case .onePair:
            return checkOnePairAndUpdateCards(cards: cards, ranks: ranks)
        case .oneCard:
            return checkOneCard(cards: cards, ranks: ranks)
        }
    }
    
    private static func checkFourCardAndUpdateCards(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var cards = cards
        var ranks = ranks
        if let number = Rank.Combination.isFourCard(cards: cards) {
            ranks.append(Rank(number: number, combination: .fourCard))
            cards.removeAll { (card) -> Bool in
                return card.number == number
            }
            return (cards,ranks)
        }
        return nil
    }
    
    private static func checkStraightAndUpdateCards(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var cards = cards
        var ranks = ranks
        if let number = Rank.Combination.isStraight(cards: cards) {
            ranks.append(Rank(number: number, combination: .straight))
            cards = removeCardsForStraight(cards: cards, number: number)
            return (cards,ranks)
        }
        return nil
    }
    
    private static func removeCardsForStraight(cards: [Card], number : Card.Number) -> [Card] {
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
    
    private static func checkTripleAndUpdateCards(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var cards = cards
        var ranks = ranks
        if let number = Rank.Combination.isTriple(cards: cards) {
            ranks.append(Rank(number: number, combination: .triple))
            cards.removeAll { (card) -> Bool in
                return card.number == number
            }
            return (cards,ranks)
        }
        return nil
    }
    
    private static func checkTwoPairAndUpdateCards(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var cards = cards
        var ranks = ranks
        if let numbers = Rank.Combination.isTwoPair(cards: cards) {
            ranks.append(Rank(number: numbers.last!, combination: .twoPair))
            cards.removeAll { (card) -> Bool in
                return numbers.contains(card.number)
            }
            return (cards,ranks)
        }
        return nil
    }
    
    private static func checkOnePairAndUpdateCards(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var cards = cards
        var ranks = ranks
        if let number = Rank.Combination.isOnePair(cards: cards) {
            ranks.append(Rank(number: number, combination: .onePair))
            cards.removeAll { (card) -> Bool in
                return card.number == number
            }
            return (cards,ranks)
        }
        return nil
    }
    
    private static func checkOneCard(cards: [Card], ranks: [Rank]) -> ([Card]?,[Rank])? {
        var ranks = ranks
        if let number = Rank.Combination.isOneCard(cards: cards) {
            ranks.append(Rank(number: number, combination: .oneCard))
            return (nil,ranks)
        }
        return nil
    }
    
}
