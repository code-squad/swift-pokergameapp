//
//  Players.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class Player {
    
    private var name: String
    public var hand = [String]()

    init(name: String, hand: [String]) {
        self.name = name
    }

}

class Players {
    
    public var willJoinGame: Array<Player> = []
    
}
