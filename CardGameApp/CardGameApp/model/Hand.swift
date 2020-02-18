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
            return .straight
        }
        
        if checkSameCard(howMany: .fourCard, card: card.sorted()){
            return .fourCard
        }
        
        if checkSameCard(howMany: .triple, card: card.sorted()){
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
                straightCount += 1
            } else{
                if preStraightCount < straightCount{
                    preStraightCount = straightCount
                }
                straightCount = 1
            }
            pre = card[cardIndex]
        }
        return ResultPriority.straight.equal(num: straightCount > preStraightCount ? straightCount : preStraightCount)
    }
    
    func checkSameCard(howMany same: ResultPriority, card: [Card]) -> Bool{
        var pre = card[0]
        var sameCardCount = 1
        var preSameCardCount = 0
        for cardIndex in 1..<card.count{
            if pre == card[cardIndex]{
                sameCardCount += 1
            } else{
                if preSameCardCount < sameCardCount{
                    preSameCardCount = sameCardCount
                }
                sameCardCount = 1
            }
            pre = card[cardIndex]
        }
        return same.equal(num: sameCardCount > preSameCardCount ? sameCardCount : preSameCardCount)
    }
    
    func checkPair(card: [Card]) -> ResultPriority{
        var pre = card[0]
        var pairCount = 0
        for cardIndex in 1..<card.count{
            if pre == card[cardIndex]{
                pairCount += 1
            }
            
            pre = card[cardIndex]
        }
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
