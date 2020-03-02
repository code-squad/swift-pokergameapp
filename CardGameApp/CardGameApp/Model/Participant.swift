//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Participant {
    enum Rank: Int, CaseIterable, Comparable {
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case straight = 6
        case fourCard = 8
        
        static func < (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func isFourCard(cards: [Card]) -> Int {
            let fourCardsCount = 4
            guard cards.count >= fourCardsCount else {
                return 0
            }
            
            let nums = generateNums(cards: cards)
            for num in nums {
                if num.value == fourCardsCount {
                    return num.value
                }
            }
            return 0
        }
        
        private static func generateNums(cards: [Card]) -> [Int:Int] {
            var nums = [Int:Int]()
            for i in 0 ..< cards.count - 1 {
                guard !nums.keys.contains(i) else {
                    continue
                }
                
                var count = 1
                for j in i + 1 ..< cards.count {
                    if cards[i].number == cards[j].number {
                        count += 1
                    }
                }
                nums[i] = count
            }
            return nums
        }
    }
}

class Participant: CardSearchable {
    let name: String
    private var cards = [Card]()
    var cardsCount: Int {
        return cards.count
    }
    var ranks = [Rank]()
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        cards = [Card]()
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach{ handler($0) }
    }
    
    func updateRanks() {
        var cards = self.cards
        if let updatedcards = checkFourCardAndUpdateCards(cards: cards) {
            cards = updatedcards
        }
    }
    
    private func checkFourCardAndUpdateCards(cards: [Card]) -> [Card]? {
        var cards = cards
        let num = Rank.isFourCard(cards: cards)
        guard num != 0 else {
            return nil
        }
        
        ranks.append(.fourCard)
        cards.removeAll { (card) -> Bool in
            return card.number == Card.Number(rawValue: num)
        }
        return cards
    }
}
