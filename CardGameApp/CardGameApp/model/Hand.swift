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
    
    private var card: [Card] = [Card]()
    var resultCardInfo: [Card] = [Card]()
    
    func append(card: Card){
        self.card.append(card)
    }
    
    func removeAll(){
        self.card.removeAll()
    }
    
    func forEachCardInHand(_ transform: (Card) -> ()){
        card.forEach {
            transform($0)
        }
    }
    
    func result() -> ResultPriority{
        if checkStraight(card: card.sorted()){
            resultCardInfo.sort(by: >)
            return .straight
        }
        
        if checkSameCard(howMany: .fourCard, card: card.sorted()){
            resultCardInfo.sort(by: >)
            return .fourCard
        }
        
        if checkSameCard(howMany: .triple, card: card.sorted()){
            resultCardInfo.sort(by: >)
            return .triple
        }
        
        return checkPair(card: card.sorted())
    }
    
    func checkStraight(card: [Card]) -> Bool{
        var pre = card[0]
        var straightCount = 1
        var preStraightCount = 0
        for cardIndex in 1..<card.count{
            if pre - card[cardIndex] == -1{
                resultCardInfo.append(pre)
                straightCount += 1
            } else{
                if preStraightCount < straightCount{
                    preStraightCount = straightCount
                }
                resultCardInfo.removeAll()
                straightCount = 1
            }
            pre = card[cardIndex]
        }
        
        resultCardInfo.reverse()
        return ResultPriority.straight.equal(num: straightCount > preStraightCount ? straightCount : preStraightCount)
    }
    
    func checkSameCard(howMany same: ResultPriority, card: [Card]) -> Bool{
        resultCardInfo.removeAll()
        var howmany = [Card : Int]()
        card.forEach{
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
    
    func checkPair(card: [Card]) -> ResultPriority{
        resultCardInfo.removeAll()
        var pre = card[0]
        var pairCount = 0
        for cardIndex in 1..<card.count{
            if pre == card[cardIndex]{
                pairCount += 1
                resultCardInfo.append(pre)
            }
            
            pre = card[cardIndex]
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
            
            for index in 0..<lhs.card.count{
                if lhs.card[index] < rhs.card[index]{
                    return lhs.card[index] < rhs.card[index]
                }
            }
        }
        return true
    }
    
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        for index in 0..<lhs.card.count{
            if lhs.card[index] != rhs.card[index]{
                return false
            }
        }
        return true
    }
}
