//
//  Player.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class Player{
    private(set) var cards : Cards
    
    init(){
        cards = Cards()
    }
}

class Players {
    var player = [Player]()
    
    init(with count : PlayOption.PlayersCount){
        for _ in 0..<count.rawValue {
            player.append(Player())
        }
    }
    func removeAllCards(){
        for person in player {
            person.cards.removeAll()
        }
    }
}
