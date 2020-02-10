//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Dealer {
    var deck = CardDeck()
    let numberOfHands: Int
    let players: [Player]
    var communityCards: [Card] = []
    
    init(numberOfHands: Int, players: [Player]) {
        self.numberOfHands = numberOfHands
        self.players = players
        
        setupHands()
        setupCommunityCards()
    }
    
    func setupHands() {
        players.forEach {
            passHands(to: $0)
        }
    }
    
    func setupCommunityCards() {
        for _ in 0..<numberOfHands {
            guard let card = deck.removeOne() else { return }
            communityCards.append(card)
        }
    }
    
    func passHands(to player: Player) {
        for _ in 0..<numberOfHands {
            guard let card = deck.removeOne() else { return }
            player.hands.append(card)
        }
    }
}
