//
//  CardDeck.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        initCards()
        shuffle() 
    }
    
    /// 모든 카드 초기화
    private mutating func initCards () {
        for suit in Card.Suit.allCases {
            initSuitCards(suit: suit)
        }
    }
    
    /// 모양 별 카드 초기화
    private mutating func initSuitCards (suit: Card.Suit) {
        for rank in Card.Rank.allCases {
            cards.append(Card(rank: rank, suit: suit))
        }
    }
    
    /// 갖고 있는 카드 개수를 반환한다.
    func count() -> Int {
        return cards.count
    }
    
    /// 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle () {
        cards = cards.shuffled()
    }
    
    /// 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne () throws -> Card {
        guard let firstCard = cards.first else {
            throw CardError.NotExistCard
        }
        
        cards.removeFirst()
        
        return firstCard
    }
    
    /// 처음처럼 모든 카드를 다시 채워넣는다.
    mutating func reset () {
        cards.removeAll()
        initCards()
    }
}
