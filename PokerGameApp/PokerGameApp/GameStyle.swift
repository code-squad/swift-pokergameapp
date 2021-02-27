//
//  GameStyle.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class GameStyle {
    private var CurrentGameStyle : Int
    
    init(GameStyle : Int){
        self.CurrentGameStyle = GameStyle
    }
    
    func distributeCardGameStyle(deck : Deck, players : Players, dealer : Dealer){
        for _ in 0..<CurrentGameStyle{
            players.distributeCardPlayers(deck : deck)
            dealer.receiveCard(deck.takeTopcard())
        }
    }
}
