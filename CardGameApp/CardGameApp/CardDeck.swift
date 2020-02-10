//
//  CardDeck.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/10.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

struct CardDeck{
    private var cardSet:[Card]
    
    init(){
        cardSet=[Card]()
        setUpCardSet()
    }
    
    private mutating func setUpCardSet(){
        for suit in Card.Suit.allCases{
            for rank in Card.Rank.allCases{
                cardSet.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    func count() -> Int{
        return cardSet.count
    }
}
