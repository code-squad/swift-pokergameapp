//
//  Player.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class Player : Dealer{
    let id : Int

    init(id : Int){
        self.id = id
    }
}

class Players {
    var player = [Player]()
    
    init(total count : Int){
        
        for id in 0..<count {
            player.append(Player(id: id))
        }
    }
    func removeAllCards(){
        for person in player {
            person.cards.removeAll()
        }
    }
}
