//
//  Score.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/28.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Score {
    
    enum ScoreWeight: Int {
        case highCard = 0
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case four = 4
        case straight = 5
    }
    
    private var cardDeck: [Card]
    private var pairDeck = [Card]()
    
    init(cardDeck : [Card]) {
        self.cardDeck = cardDeck
    }
    
    public func calculateScore() -> ScoreWeight {
        let score: ScoreWeight = .highCard
        sortCard()
        
        return score
    }
    
    // 이제 숫자(랭크)순으로 정렬되어있을 것임.
    // 내림차순으로.
    private func sortCard() {
        cardDeck.sort { ( first, second) -> Bool in
            first > second
        }
    }
    
    // 정렬후 checkPair onePair인지 twoPair인지 triple인지....
    // count 시작값이 1이여야 제대로 세어짐.
    // 원페어는 pairCount가 2인 상황이 2번 이루어져야 하는데....?
    // 배열로 해결봐야하나 일단 하고 리팩토링 예정
    private func judgeDeckPairCount() -> [Int] {
        var pairCount = 1
        var pairCountCollection = [Int]()
        for index in 0 ..< cardDeck.count-1 {
            if cardDeck[index].rank == cardDeck[index+1].rank {
                pairCount += 1
            } else {
                pairCount = 1
            }
            
            if pairCount > 2 {
                pairCountCollection.append(pairCount)
            }
        }
        
        return pairCountCollection
    }
    
    private func isStraight() {
        
    }
}
