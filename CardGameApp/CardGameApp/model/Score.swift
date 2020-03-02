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
        sortCard()
    }
    
    public func calculateScore() -> ScoreWeight {
        var pairDeck = [Card : Int]()
        var score: ScoreWeight = .highCard
        if isStraight(cardDeck: cardDeck) {
            score = .straight
        }
        pairDeck = judgeDeckPairCount(cardDeck: cardDeck)
        
        let highestPairCount = pairDeck.values.max()
        
        
        
        return score
    }
    
    private func sortCard() {
        cardDeck.sort { ( first, second) -> Bool in
            first > second
        }
    }
    
    private func judgeDeckPairCount(cardDeck: [Card]) -> [Card : Int] {
        var pairDeckCollection = [Card : Int]()
        
        cardDeck.forEach { (card) in
            pairDeckCollection[card] = cardDeck.filter { $0.rank == card.rank }.count
        }
        
        return pairDeckCollection
    }
    
    private func isStraight(cardDeck: [Card]) -> Bool {
        var straightCount = 1
        var currentCard = cardDeck[0]
        
        // forEach는 return이 안먹힌다.
        for card in cardDeck {
            if currentCard.isContinousRank(nextCard: card) {
                straightCount += 1
                if straightCount == 5 {
                    return true
                }
            } else {
                straightCount = 1
            }
            currentCard = card
        }
        return false
    }
}
