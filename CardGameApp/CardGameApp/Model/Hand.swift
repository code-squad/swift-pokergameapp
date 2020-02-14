//
//  Hand.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Hand {
    enum Score: Int {
        case none = 0
        case onePair
        case twoPair
        case triple
        case fourCard
        case straight
    }
    private var cards = [Card]()
    
    func forEach(_ transform: (Card) -> ()) {
        cards.forEach(transform)
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    private func checkStraight() -> Bool {
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
    
    private func getInfo() -> [Int:Int]{
        let result = cards.reduce(into: [Int:Int]()) {
            if $0[$1.number] == nil {
                $0[$1.number] = 1
            } else {
                $0[$1.number]! += 1
            }
        }
        return result
    }
    
    func getScore() -> (Score ,Int) {
        let result = getInfo()
        let info = result.sorted { (lhs, rhs) -> Bool in
            if lhs.value == rhs.value {
                return lhs.key > rhs.key
            } else {
                return lhs.value > rhs.value
            }
        }
        
        if checkStraight() {
            return (.straight, info[0].key)
        } else if info.contains(where: { $0.value == 4 }) {
            return (.fourCard, info[0].key)
        } else if info.contains(where: { $0.value == 3 }) {
            return (.triple, info[0].key)
        }
        
        let pairs = info.filter { $0.value == 2 }
        
        if pairs.count == 2 {
            return (.twoPair, info[0].key)
        } else if pairs.count == 1 {
            return (.onePair, info[0].key)
        } else {
            return (.none, info[0].key)
        }
    }
}
