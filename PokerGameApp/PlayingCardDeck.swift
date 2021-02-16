//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

class PlayingCardDeck {
    
    public var count : Int {
        get {
            return cards.count
        }
    }
    private var cards  = [PlayingCard]()
    
    init(){
        reset()
    }
    
    private func initialize(){
        for suit in PlayingCard.Suit.allCases {
            for rank in PlayingCard.Rank.allCases {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    func shuffle(){
        cards.shuffle()
    }
    
    @discardableResult
    func removeOne() -> PlayingCard?{
        return cards.popLast()
    }
    
    func reset(){
        cards.removeAll()
        initialize()
    }
}
