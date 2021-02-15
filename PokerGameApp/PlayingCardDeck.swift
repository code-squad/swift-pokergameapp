//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

struct PlayingCardDeck {
    private var count : Int = 0
    private var cards  = [PlayingCard]()
    
    init(){
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
                count += 1
            }
        }
        print("카드 전체를 초기화했습니다.")
        print("총 \(count)장의 카드가 있습니다.")
    }
    
}
