//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

class CardDeck : CustomStringConvertible{

    public var count : Int {
        get {
            return cards.count
        }
    }
    private var cards  = [PlayingCard]()
    
    var description: String {
        return cards.description
    }
    
    public func initialize(){
        removeAll()
        for suit in PlayingCard.Suit.allCases {
            for rank in PlayingCard.Rank.allCases {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    public func shuffle(){
        cards.shuffle()
    }
    
    @discardableResult
    public func removeOneCard() -> PlayingCard?{
        return cards.popLast()
    }
    
    public func removeCards(count : Int) -> [PlayingCard] {
        var removedCards = [PlayingCard]()
        for _ in 0..<count {
            guard let removedCard = removeOneCard() else {
                return [PlayingCard]()
            }
            removedCards.append(removedCard)
        }
        return removedCards
    }
    
    public func takeOneCard(card : PlayingCard){
        cards.append(card)
    }
    
    public func takeCards(cards : [PlayingCard]){
        self.cards.append(contentsOf: cards)
    }
    public func removeAll(){
        cards.removeAll()
    }
}
