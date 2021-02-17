//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

class PlayingCardDeck : CustomStringConvertible{

    public var count : Int {
        get {
            return cards.count
        }
    }
    private var cards  = [PlayingCard]()
    
    var description: String {
        return cards.description
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
    func removeOneCard() -> PlayingCard?{
        return cards.popLast()
    }
    
    func removeCards(count : Int) -> [PlayingCard] {
        var removedCards = [PlayingCard]()
        for _ in 0..<count {
            guard let removedCard = removeOneCard() else {
                return [PlayingCard]()
            }
            removedCards.append(removedCard)
        }
        return removedCards
    }
    
    func takeOneCard(card : PlayingCard){
        cards.append(card)
    }
    
    func takeCards(cards : [PlayingCard]){
        self.cards.append(contentsOf: cards)
    }
    func reset(){
        cards.removeAll()
        initialize()
    }
}
