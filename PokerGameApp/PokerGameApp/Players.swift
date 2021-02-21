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
        print("플레이어 카운트 \(self.playerCount)")
    }
    
    func decidePlayerNum() -> Void {
        for _ in 0..<playerCount{
            let newplayer = Player()
            players.append(newplayer)
        }
    }
    
    func printCardplayers(index : Int) -> Void{
        players[index].printMyCard()
    }
    
    func playerCards(playerindex : Int, cardindex : Int) -> String{
        return players[playerindex].myCardDescription(index: cardindex)
    }
    
    func currentPlayers() -> Int{
        return players.count
    }
    
    func throwCardtoPlayer(_ index : Int, _ card : Card){
        players[index].receiveCard(card)
    }
}
