//
//  Hands.swift
//  CardGameApp
//
//  Created by delma on 18/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Hands: Equatable {
    private var hands = [Card]()
    
    static func == (lhs: Hands, rhs: Hands) -> Bool {
        return lhs.hands == rhs.hands
    }
    
    func append(_ card: Card) {
        hands.append(card)
    }
    
    func forEach(_ handler: (Card) -> Void ) {
        hands.forEach(handler)
    }
    
    func count() -> Int {
        return hands.count
    }
    
    func shuffle() {
        hands.shuffle()
    }
    
    func removeOne() -> Card? {
        return hands.removeFirst()
    }
    
    func countPairNumber() -> [Int] {
        let cards = sortCards()
        var pairCount = 1
        var pairs: [Int] = []
        for index in 0 ..< (cards.count - 1) {
            if cards[index].number == cards[index + 1].number {
                pairCount += 1
            } else {
                pairCount = 1
            }
            
            if pairCount != 1 {
                pairs.append(pairCount)
            }
        }
        return pairs
    }
    
    func sortCards() -> [Card] {
        hands.sort { (first, second) -> Bool in
            first > second
        }
        return hands
    }
    
    func judgeStraight() -> Bool {
        let cards = sortCards()
        for index in 0..<cards.count {
            if cards[index] >> cards[index+1] {
                return false
            }
        }
        return true
        
    }
    
    func judgeResult() -> GameResult {
        var result = GameResult.none
        let pairs = countPairNumber()
        var twoPairCount = 0
        if judgeStraight() {
            return GameResult.straight
        }else if pairs.count == 0 {
            return result
        }else {
            for pair in pairs {
                if pair == 2 {
                    twoPairCount += 1
                }
            }
        }
        
        guard let maxValue = pairs.max() else { return result }
        
        if maxValue == 3 {
            result = GameResult.tripple
        }else if maxValue == 4 {
            result = GameResult.fourCard
        }else if maxValue == 2, twoPairCount == 1 {
            result = GameResult.onePair
        }else if maxValue == 2, twoPairCount >= 2 {
            result = GameResult.twoPair
        }

        return result
    }

}
