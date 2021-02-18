//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/18.
//

import Foundation

class PokerGame{
    var gameStyle : Int
    var player : [Player]
    
    init(GameStyle : Int) {
        self.gameStyle = GameStyle
        player = []
    }
    
    func decidePlayerNum(_ playerCount : Int) -> Void   {
        for i in 0..<playerCount{
            let newplayer = Player()
            player.append(newplayer)
        }
    }
}

class Player{
    private var myCard : [Card] = []
    
    func addCardtoPlayer(_ card : Card) -> Void{
        myCard.append(card)
    }
}
