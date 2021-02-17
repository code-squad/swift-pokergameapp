//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation

class Dealer : Player {
    
    private var gameCardDeck = CardDeck()
    private(set) var cardSqud = InputView.CardStud.five
    
    override init(){
        gameCardDeck.initialize()
    }
    
    public func spreadCardsToPlayer(players : inout Players){
        for player in players.player {
            let cards = gameCardDeck.removeCards(count: cardSqud.rawValue)
            player.cards.takeCards(cards: cards)
        }
    }
    
    public func spreadCardsToDealer(){
        let cards = gameCardDeck.removeCards(count: cardSqud.rawValue)
        self.cards.takeCards(cards: cards)
    }
    public func shuffleCards(){
        gameCardDeck.shuffle()
    }
    
    public func removeAllCards(){
        cards.removeAll()
    }
}
