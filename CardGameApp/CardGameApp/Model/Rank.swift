//
//  Rank.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Rank {
    
    let number: Card.Number
    let combination: Combination
    
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
