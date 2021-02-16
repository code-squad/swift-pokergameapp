//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 서우석 on 2021/02/16.
//

import Foundation
struct CardDeck {
    
    private var deckOfCard: [Card]
    
    init() {
        deckOfCard = [Card]()
        
    }
    
    /*
     구조체의 매서드가 구조체 내부에서 데이터를 수정할 때에는 mutating키워드 선언이 필수
     mutating과 상관없이 let으로 선언된 경우는 수정 불가
    */
    private mutating func setCardDeck() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                deckOfCard.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return self.deckOfCard.count
    }
}
