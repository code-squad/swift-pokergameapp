//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/27.
//

import UIKit

class Dealer : Player{
    private let deck : Deck
    
    init(dealerdeck : Deck){
        self.deck = dealerdeck
    }
    
    func deckCreateShuffle(){
        deck.resetDeck()
        deck.shuffleDeck()
    }
    
    func shuffleDeck(){
        deck.shuffleDeck()
    }
    
    func currentDeckcount() -> Int{
        return deck.count()
    }
    
    func distributeCard(players : Players, GameStyle : GameStyle, dealer : Dealer) {
        GameStyle.distributeCardGameStyle(deck: deck, players: players, dealer: dealer)
    }
}
