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
        
        return .noPair
    }
    
    func checkStraight(card: [Card]) -> Bool{
        var pre = card[0]
        var straightCount = 1
        for cardIndex in 1..<card.count{
            if pre - card[cardIndex] == -1{
                straightCount += 1
            } else{
                straightCount = 1
            }
            pre = card[cardIndex]
        }
        return ResultPriority.straight.equal(num: straightCount)
    }
    
    func checkSameCard(howMany same: ResultPriority, card: [Card]) -> Bool{
        var pre = card[0]
        var sameCardCount = 1
        for cardIndex in 1..<card.count{
            if pre == card[cardIndex]{
                sameCardCount += 1
            } else{
                sameCardCount = 1
            }
            pre = card[cardIndex]
        }
        return same.equal(num: sameCardCount)
    }
    
    func checkPair(card: [Card]) -> ResultPriority{
        var pre = card[0]
        var sameCardCount = 1
        var pairCount = 0
        for cardIndex in 1..<card.count{
            if pre == card[cardIndex]{
                sameCardCount += 1
            } else{
                sameCardCount = 1
            }
            
            if sameCardCount == 2{
                pairCount += 1
                sameCardCount = 1
            }
            
            pre = card[cardIndex]
        }
        return ResultPriority.init(rawValue: pairCount) ?? ResultPriority.twoPair
    }
}
