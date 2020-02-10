//
//  PokerGame.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class PokerGame {
    let dealer = Dealer()
    var players = [Player]()
    var studNumber: Int
    
    enum Stud: Int {
           case five = 5
           case seven = 7
   }

    enum PlayerCount: Int {
        case one = 1, two, three, four
    }
    
    init(playerCount: PlayerCount, stud: Stud) {
        self.studNumber = stud.rawValue
        for _ in 0..<playerCount.rawValue {
            self.players.append(Player())
        }
    }
    
    func allocateCards(studNumber: Int) {
        for player in players {
            for _ in 0..<studNumber {
                guard let card = dealer.cardDeck.removeOne() else { return }
                player.cards.append(card)
            }
        }
        guard let card = dealer.cardDeck.removeOne() else { return }
        dealer.cards.append(card)
    }
    
}
