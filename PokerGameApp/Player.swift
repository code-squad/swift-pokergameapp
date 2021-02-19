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
    func eachCards(_ method: (Card) -> ()){
        cards.cards.forEach{ method($0)}
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
    func eachPlayers(_ method : (Int, Player) -> ()){
        for (index, one) in player.enumerated(){
            method(index+1, one)
        }
    }
}
