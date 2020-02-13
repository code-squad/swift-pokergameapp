//
//  Hand.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Hand {
    private var cards = [Card]()
    
    func forEach(_ transform: (Card) -> ()) {
        cards.forEach(transform)
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    func checkStraight() -> Bool {
        let cardSet = Set<Int>(cards.map { $0.number }).sorted()
        var straightCount = 1
        var index = 1
        while index < cardSet.count {
            if cardSet[index - 1] + 1 == cardSet[index] {
                straightCount += 1
            } else {
                straightCount = 1
            }
            index += 1
        }
        return straightCount == 5
    }
    
    func getInfo() -> [Int:Int]{
        let result = cards.reduce(into: [Int:Int]()) {
            if $0[$1.number] == nil {
                $0[$1.number] = 1
            } else {
                $0[$1.number]! += 1
            }
        }
        return result
    }
}
