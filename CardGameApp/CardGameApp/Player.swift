//
//  Player.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Player: Participant {
    private let name: String
    private var cards = Cards()
    
    var description: String {
        return "\(name) \(cards)"
    }
    
    init(name: String, cards: Cards){
        self.name = name
        self.cards = cards
    }
    
    func compareNameOrdered (otherPlayer: Player) -> Bool {
        return name < otherPlayer.name
    }
    
    func comparePoint(_ other: Player?) -> (Player?, String?) {
        guard let otherPlayer = other else {
            return (self, name)
        }
        
        let playerScore = cards.checkEqualRankCount()
        let otherPlayerScore = otherPlayer.cards.checkEqualRankCount()
        
        if playerScore.0.rawValue > otherPlayerScore.0.rawValue {
            return (self, name)
        }
        if playerScore.0.rawValue < otherPlayerScore.0.rawValue {
            return (otherPlayer, otherPlayer.name)
        }
        
        if playerScore.0 == Score.nonScore {
            return (nil, nil)
        }
        
        guard let playerMaxCard = playerScore.1 else {
            return (otherPlayer, otherPlayer.name)
        }
        
        guard let otherPlayerMaxCard = otherPlayerScore.1 else {
            return (self, name)
        }
        
        if playerMaxCard.isHigherThan(otherPlayerMaxCard) {
            return (self, name)
        }
        
        return (otherPlayer, otherPlayer.name)
    }
    
    
}
