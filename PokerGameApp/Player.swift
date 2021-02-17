//
//  Player.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class Player{
    let id : Int
    var cards = PlayingCardDeck()

    init(id : Int){
        self.id = id
    }
}

class Players {
    var player = [Player]()
    
    init(totalPlayers playerNumber : Int){
        
        for id in 0..<playerNumber {
            player.append(Player(id: id))
        }
    }
}
