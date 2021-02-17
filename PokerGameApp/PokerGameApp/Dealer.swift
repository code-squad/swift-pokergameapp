//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation



struct Dealer : CustomStringConvertible{
    
    private var description: String { return "\(cards)" }
    private var cardDeck: CardDeck
    private var cards:[Card] = []
    
    init() {
        self.cardDeck = CardDeck()
    }
    
    mutating func distributeCard(with player: Player, stud: Int) -> Bool{
        switch stud {
        case 5:
            guard let newCards = cardDeck.fiveStudCards() else {return false}
            player.receiveCards(with: newCards)
        case 7:
            guard let newCards = cardDeck.sevenStudCards() else {return false}
            player.receiveCards(with: newCards)
        default:
            return false
        }
        return true
    }
    
    mutating func takeDealerCards(stud: Int) -> Bool {
        switch stud {
        case 5:
            guard let newCards = cardDeck.fiveStudCards() else {return false}
            self.cards = newCards
        case 7:
            guard let newCards = cardDeck.sevenStudCards() else {return false}
            self.cards = newCards
        default:
            return false
        }
        return true
    }
    
    mutating func shuffle() {
        cardDeck.shuffle()
    }
}
