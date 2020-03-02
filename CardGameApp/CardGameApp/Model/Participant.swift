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

extension Participant {
    enum Rank: Int, CaseIterable, Comparable {
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case straight = 7
        case fourCard = 9
        
        static func < (lhs: Rank, rhs: Rank) -> Bool {
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
        
        static func isTwoPair(cards: [Card]) -> Card.Number? {
            let fourCardsCount = 4
            guard cards.count >= fourCardsCount else {
                return nil
            }
            let nums = generateNums(cards: cards)
            let sameCardsCount = 2
            
            var count = 0
            var curNum: Card.Number?
            for num in nums {
                if num.value == sameCardsCount {
                    curNum = num.key
                    count += 1
                }
            }
            
            if count >= 2 {
                return curNum
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
        if let num = Rank.isFourCard(cards: cards) {
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
        if let num = Rank.isStraight(cards: cards) {
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
        if let num = Rank.isTriple(cards: cards) {
            ranks.append(.triple)
            cards.removeAll { (card) -> Bool in
                return card.number == num
            }
            return cards
        }
        return nil
    }
    
    private func checkTwoPairAndUpdateCards(cards: [Card]) -> Bool {
        if let num = Rank.isTwoPair(cards: cards) {
            ranks.append(.twoPair)
            return true
        }
        return false
    }
    
    private func checkOnePairAndUpdateCards(cards: [Card]) -> Bool {
        if let num = Rank.isOnePair(cards: cards) {
            ranks.append(.onePair)
            return true
        }
        return false
    }
    
}
