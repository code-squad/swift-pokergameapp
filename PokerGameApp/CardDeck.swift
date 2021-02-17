//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

class CardDeck : Cards{
    
    public var count : Int {
        get {
            return cards.count
        }
    }

    override init(){
        super.init()
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    public func shuffle(){
        cards.shuffle()
    }
}
