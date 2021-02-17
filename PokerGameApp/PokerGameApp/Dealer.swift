//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation



struct Dealer : CustomStringConvertible{
    
    var description: String { return "\(cards)" }
    var cardDeck: CardDeck
    var cards:[Card] = []
    
    init() {
        self.cardDeck = CardDeck()
    }
    
    mutating func distributeCard(with player: Player, stud: Int) {
        switch stud {
        case 5:
            guard let newCards = cardDeck.fiveStudCards() else {return}
            player.receiveCards(with: newCards)
        case 7:
            guard let newCards = cardDeck.sevenStudCards() else {return}
            player.receiveCards(with: newCards)
        default:
            return
        }
    }
    
    mutating func takeDealerCards(stud: Int) {
        switch stud {
        case 5:
            guard let newCards = cardDeck.fiveStudCards() else {return}
            self.cards = newCards
        case 7:
            guard let newCards = cardDeck.sevenStudCards() else {return}
            self.cards = newCards
        default:
            return
        }
    }
}
