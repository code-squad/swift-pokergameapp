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
    
    mutating func shuffle(){
        if count() != 1{
            self.cardSet.shuffle()
        }
    }
    
    mutating func removeOne() -> Card?{
        guard count() > 0 else{
            return nil
        }
        return cardSet.removeLast()
    }
    
    mutating func reset(){
        cardSet=[Card]()
        setUpCardSet()
    }
}

extension CardDeck:Equatable{
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        guard lhs.cardSet == rhs.cardSet else {
            return false
        }
        return true
    }
}
