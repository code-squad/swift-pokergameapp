//
//  Players.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/19.
//

import Foundation


class Players{
    private var players : [Player]
    private let playerCount : Int
    
    init(playerCount : Int){
        self.players = []
        self.playerCount = playerCount
    }
    
    func decidePlayerNum() -> Void {
        for _ in 0..<playerCount{
            let newplayer = Player()
            players.append(newplayer)
        }
    }
    
    func distributeCardPlayers(deck : Deck){
        for i in 0..<players.count{
            let currentCard = deck.takeTopcard()
            players[i].receiveCard(currentCard)
            deck.removeTopCard()
        }
    }
    
    func showYourHands(){
        for i in 0..<players.count{
            players[i].showMyHands()
        }
    }
}
