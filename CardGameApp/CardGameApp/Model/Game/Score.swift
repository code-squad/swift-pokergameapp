//
//  Score.swift
//  CardGame
//
//  Created by Elena on 04/02/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ScoreCalculator {
    
    private static func sameCount(_ number: Number, _ cards: [Card]) -> Int? {
        var count = 0
        for card in cards {
            if card.same(number) {
                count += 1
            }
        }
        guard count != 0 else { return nil }
        return count
    }

    private static func countRank(_ cards: [Card]) -> [Number: Int] {
        
        var ranks: [Number: Int] = [:]
        for number in Number.allCases {
            guard let count = sameCount(number,cards) else { continue }
            ranks[number] = count
        }
        return ranks
    }
 
    
    //도형도 순위가 다르기 때문에 체크를 해줘야한다.
    private static func getRankShape(_ number: Number,_ cards: [Card]) -> Shape? {
        let shapeCard = cards.compactMap { $0.same(number) ? $0 : nil }
        guard let cardWithBestShape = shapeCard.max() else { return nil }
        for shape in Shape.allCases {
            if cardWithBestShape.same(shape) {
                return shape
            }
        }
        return nil
    }

    static func getRank(_ cards: CardStack) -> HandBetting? {
        let rank = makeRanks(cards.getCardData())
        guard let winRank = rank.max() else { return nil }
        return winRank
    }

    private static func makeRanks(_ cards: [Card]) -> [HandBetting] {
        let ranks: [Number: Int] = countRank(cards)
        var rank: [HandBetting] = []
        for index in ranks {
            let numberRank = index.key
            guard let shapeRank = getRankShape(numberRank,cards) else { continue }
            switch index.value {
                case 4: rank.append(HandBetting.fourOfAKind(shapeRank,numberRank))
                case 3: rank.append(HandBetting.threeOfAKind(shapeRank,numberRank))
                case 2: rank.append(HandBetting.onePair(shapeRank,numberRank))
                case 1: rank.append(HandBetting.highCard(shapeRank,numberRank))
                default: continue
            }
        }
        if let twoPair = getTwoPair(rank) {
            rank.append(twoPair)
        }
        return rank
    }
    
    private static func getTwoPair(_ rank: [HandBetting]) -> HandBetting? {
        let onePairs = rank.compactMap { $0.ranking == HandBetting.onePair($0.shape,$0.number).ranking ? $0 : nil }
        guard onePairs.count > 1 else { return nil }
        guard let firstOnePair = onePairs.max() else { return nil }
        return HandBetting.twoPair(firstOnePair.shape,firstOnePair.number)
    }
    
}

