//
//  Cards.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation

class Cards : CustomStringConvertible{
    
    public var cards  = [Card]()
    
    var description: String {
        return cards.description
    }
    
    @discardableResult
    public func removeOneCard() -> Card?{
        return cards.popLast()
    }
    
    public func removeCards(count : Int) -> [Card] {
        var removedCards = [Card]()
        for _ in 0..<count {
            guard let removedCard = removeOneCard() else { return [Card]() }
            removedCards.append(removedCard)
        }
        return removedCards
    }
    
    public func takeOneCard(card : Card){
        cards.append(card)
    }
    
    public func takeCards(cards : [Card]){
        self.cards.append(contentsOf: cards)
    }
    public func removeAll(){
        cards.removeAll()
    }
}
