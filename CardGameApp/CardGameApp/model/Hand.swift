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
        if checkStraight(cards: cards.sorted()){
            resultCardInfo.sort(by: >)
            return .straight
        }
        
        if checkSameCard(howMany: .fourCard, cards: cards.sorted()){
            resultCardInfo.sort(by: >)
            return .fourCard
        }
        
        if checkSameCard(howMany: .triple, cards: cards.sorted()){
            resultCardInfo.sort(by: >)
            return .triple
        }
        
        return checkPair(cards: cards.sorted())
    }
    
    func checkStraight(cards: [Card]) -> Bool{
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
    
    func checkSameCard(howMany same: ResultPriority, cards: [Card]) -> Bool{
        resultCardInfo.removeAll()
        var howmany = [Card : Int]()
        cards.forEach{
            if howmany[$0] == nil{
                howmany[$0] = 1
            } else{
                howmany.updateValue(howmany[$0]! + 1, forKey: $0)
            }
        }
        
        if howmany.values.contains(4){
            for (key,value) in howmany{
                if value == 4{
                    resultCardInfo.append(key)
                }
            }
            return true
        } else if howmany.values.contains(3){
            for (key,value) in howmany{
                if value == 3{
                    resultCardInfo.append(key)
                }
            }
            return true
        }
        return false
    }
    
    func checkPair(cards: [Card]) -> ResultPriority{
        resultCardInfo.removeAll()
        var previousCard = cards[0]
        var pairCount = 0
        for cardIndex in 1..<cards.count{
            let nextCard = cards[cardIndex]
            if previousCard == nextCard{
                pairCount += 1
                resultCardInfo.append(previousCard)
            }
            
            previousCard = nextCard
        }
        
        resultCardInfo.reverse()
        return ResultPriority.init(rawValue: pairCount >= 3 ? 2 : pairCount)!
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
