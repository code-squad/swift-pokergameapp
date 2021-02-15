//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

struct PlayingCardDeck {
    
    private var count : Int {
        get {
            return cards.count
        }
    }
    private var cards  = [PlayingCard]()
    
    init(){
        reset()
    }
    
    mutating func initialize(){
        for suit in PlayingCard.Suit.allCases {
            for rank in PlayingCard.Rank.allCases {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func removeOne() -> PlayingCard?{
        return cards.popLast()
    }
    
    mutating func reset(){
        cards.removeAll()
        initialize()
    }
}
