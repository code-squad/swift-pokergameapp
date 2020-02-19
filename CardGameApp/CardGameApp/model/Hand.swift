//
//  Hand.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/13.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Hand{
    enum ResultPriority: Int{
        case noPair = 0, onePair, twoPair, triple, fourCard, straight
        
        func equal(num: Int) -> Bool{
            return self.rawValue == num
        }
    }
    
    private var cards: [Card] = [Card]()
    private var resultCardInfo: [Card] = [Card]()
    
    func append(card: Card){
        self.cards.append(card)
    }
    
    func removeAll(){
        self.cards.removeAll()
    }
    
    func forEachCardInHand(_ transform: (Card) -> ()){
        cards.forEach {
            transform($0)
        }
    }
    
    func result() -> ResultPriority{
        if isStraight(cards: cards.sorted()){
            resultCardInfo.sort(by: >)
            return .straight
        }
        
        return getCardPriority(cards: cards.sorted())
    }
    
    func isStraight(cards: [Card]) -> Bool{
        var previousCard = cards[0]
        var straightCount = 1
        var previousStraightCount = 0
        for cardIndex in 1..<cards.count{
            let nextCard = cards[cardIndex]
            if previousCard.isSerial(card: nextCard){
                resultCardInfo.append(previousCard)
                straightCount += 1
            } else{
                if previousStraightCount < straightCount{
                    previousStraightCount = straightCount
                }
                resultCardInfo.removeAll()
                straightCount = 1
            }
            previousCard = nextCard
        }
        
        resultCardInfo.reverse()
        return ResultPriority.straight.equal(num: straightCount > previousStraightCount ? straightCount : previousStraightCount)
    }
    
    func getCardPriority(cards: [Card]) -> ResultPriority{
        resultCardInfo.removeAll()
        var howMany = [Card : Int]()
        cards.forEach{
            let card = $0
            howMany[card] = cards.filter{card == $0}.count
        }
        
        let highestRankFrequency = howMany.values.max()!
        
        if highestRankFrequency == 1 {
            return .noPair
        }
        
        for (key,value) in howMany{
            if value == highestRankFrequency{
                resultCardInfo.append(key)
            }
            resultCardInfo.sort(by: >)
        }
        
        return ResultPriority(rawValue: highestRankFrequency == 2 && resultCardInfo.count == 1 ? 1 : highestRankFrequency)!
    }
}

extension Hand.ResultPriority: Comparable{
    static func < (lhs: Hand.ResultPriority, rhs: Hand.ResultPriority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Hand: Comparable{
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.result() != rhs.result(){
            return lhs.result() < rhs.result()
        } else{
            for index in 0..<lhs.resultCardInfo.count{
                if lhs.resultCardInfo[index] != rhs.resultCardInfo[index]{
                    return lhs.resultCardInfo[index] < rhs.resultCardInfo[index]
                }
            }
            
            for index in 0..<lhs.cards.count{
                if lhs.cards[index] < rhs.cards[index]{
                    return lhs.cards[index] < rhs.cards[index]
                }
            }
        }
        return true
    }
    
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        for index in 0..<lhs.cards.count{
            if lhs.cards[index] != rhs.cards[index]{
                return false
            }
        }
        return true
    }
}
