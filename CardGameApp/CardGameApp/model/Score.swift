//
//  Score.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/28.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Score {
    
    // 가중치
    // 근데 랭크도 비교해야 한다... 일단 원페어인지 투페어인지 트리플인지...로 나누고
    // 그다음 스다하클 순으로 비교
    enum ScoreWeight: Int {
        case highCard = 0
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case four = 4
        case straight = 5
    }
    
    private var cardDeck: [Card]
    
    init(cardDeck : [Card]) {
        self.cardDeck = cardDeck
    }
    
    public func calculateScore() -> ScoreWeight {
        
    }
    
    // 이제 숫자(랭크)순으로 정렬되어있을 것임.
    private func sortCard() {
        cardDeck.sort { ( first, second) -> Bool in
            first > second
        }
    }
    
    // 정렬후 checkPair onePair인지 twoPair인지
    private func checkPair() {
        
    }
    
    private func isStraight() {
        
    }
}
