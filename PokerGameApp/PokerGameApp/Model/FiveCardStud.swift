//
//  FiveCardStud.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/17.
//

import Foundation

class FiveCardStud: PokerGame {
    override func participate() {
        let per1 = Player()
        let per2 = Player()
        let per3 = Player()
        players.append(per1)
        players.append(per2)
        players.append(per3)
    }
    override func startGame() {
        super.startGame()
        players.forEach { (player) in
            for _ in 0...4 {
                player.playerCards.append(cardDeck.removeOne())
            }
        }
        for _ in 0...4 {
            dealer.dealerCards.append(cardDeck.removeOne())
        }
    }
}
