//
//  Player.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class Player{
    private(set) var cards : CardDeck
    
    init(){
        cards = CardDeck()
    }
}

class Players {
    var player = [Player]()
    
    init(with count : InputView.PlayersCount){
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
