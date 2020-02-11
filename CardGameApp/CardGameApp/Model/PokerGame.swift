//
//  PokerGame.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class PokerGame {
    private let dealer = Dealer()
    private var players = [Player]()
    private var studNumber: Int
    
    enum Stud: Int {
           case five = 5
           case seven = 7
        
        func getRawValue(stud: Stud) -> Stud.RawValue {
            return stud.rawValue
        }
   }

    enum PlayerCount: Int {
        case one = 1, two, three, four
        
        func getRawValue(playerCount: PlayerCount) -> PlayerCount.RawValue {
            return playerCount.rawValue
        }
    }
    
    init(playerCount: PlayerCount, stud: Stud) {
        self.studNumber = stud.getRawValue(stud: stud)
        for _ in 0..<playerCount.getRawValue(playerCount: playerCount) {
            self.players.append(Player())
        }
    }
    
    func allocateCards() {
        dealer.shuffle()
        for _ in 0..<studNumber {
            for player in players {
                guard let card = dealer.removeOne() else { return }
                player.appendCard(card)
            }
            guard let card = dealer.removeOne() else { return }
            dealer.appendCard(card)
        }
    }
    
    func leftCards() -> Int {
       return dealer.count()
    }
    
}
