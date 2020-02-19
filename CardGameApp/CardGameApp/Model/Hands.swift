//
//  Hands.swift
//  CardGameApp
//
//  Created by delma on 18/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Hands {
    private var hands = [Card]()
    private var cardCounts = Dictionary<Card.Number, Int>()
    
    enum GameResult: Int {
        case none = 0
        case onePair
        case twoPair
        case tripple
        case fourCard
        case straight
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
    
    func countCardNumber(){
        for card in hands {
            if let value = cardCounts[card.number] {
                cardCounts.updateValue(value + 1, forKey: card.number)
            } else {
                cardCounts.updateValue(1, forKey: card.number)
            }
        }
    }
    
    func judgeStraight() -> Bool {
        hands.sort { (first, second) -> Bool in
            return first.number.rawValue > second.number.rawValue
        }
        let first = hands[0]
        var firstValue = first.number.rawValue
        firstValue = firstValue + hands.count - 1

        if firstValue == hands[hands.count - 1].number.rawValue {
            return true
        }
        return false
    }
    
    func judgeMuchCard() -> (cardsCount: Int, twoPairs: [Card.Number]) {
        countCardNumber()
        var bestValue = 0
        var bestKey = Card.Number.one
        var twoPairs: [Card.Number] = []
        for (key, value) in cardCounts {
            if value > bestValue {
                bestValue = value
                bestKey = key
            }
            if value == 2 {
                twoPairs.append(key)
            }
        }
        return (bestValue, twoPairs)
    }
    
    func judgeResult() -> GameResult? {
        let cardCount = judgeMuchCard().cardsCount
        let twoPairs = judgeMuchCard().twoPairs
        let isStraight = judgeStraight()
        
        guard cardCount > 2 && twoPairs.count == 0 else { return GameResult.twoPair }
        guard !isStraight else { return GameResult.straight }
        
        switch cardCount {
        case 0, 1:
            return GameResult.none
        case 2:
            return GameResult.onePair
        case 3:
            return GameResult.tripple
        case 4, 5:
            return GameResult.fourCard
        default:
            return GameResult.none
        }
    }
    
}
