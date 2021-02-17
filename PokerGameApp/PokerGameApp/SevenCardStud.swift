//
//  SevenCardStud.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/17.
//

import Foundation

class SevenCardStud: PokerGame {
    override func participate() {
        let per1 = Player()
        let per2 = Player()
        players.append(per1)
        players.append(per2)
    }
    override func readyToGameStart() {
        super.readyToGameStart()
        players.forEach { (player) in
            for _ in 0...6 {
                player.playerCards.append(cardDeck.removeOne())
            }
        }
        for _ in 0...6 {
            dealer.dealerCards.append(cardDeck.removeOne())
        }
    }
}
