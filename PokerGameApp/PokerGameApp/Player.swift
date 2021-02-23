//
//  Player.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/18.
//

import Foundation

class Player: CustomStringConvertible {
    var description: String{
        return player.description
    }
    
    private(set) var player: [Card]
    
    init() {
        self.player = [Card]()
    }
    
    func receiveCard(card: Card) {
        player.append(card)
    }
}
