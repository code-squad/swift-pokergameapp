//
//  PokerGameBaord.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import Foundation

struct PokerGameBaord {
    private let dealer: Dealer
    private let players: [Player]
    
    init(dealer: Dealer, players: [Player]) {
        self.dealer = dealer
        self.players = players
    }
    
    var dealerInfo: Dealer {
        return dealer
    }
    
    var playersInfo: [Player] {
        return players
    }
}
