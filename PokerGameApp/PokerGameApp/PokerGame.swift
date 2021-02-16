//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class PockerGame {
    var cardDeck = CardDeck()
    let players : [Player]
    let player1 = Player()
    let player2 = Player()
    let player3 = Player()
    let dealer = Dealer()
    
    init() {
        cardDeck.shuffle()
        players = [player1,player2,player3,dealer]
        
    }
    
    func drawCard() {
        for player in players.enumerated() {
            (0...6).forEach { _ in
                player.element.receiveCard(card: cardDeck.removeOne())
            }
        }
    }
    
    func showPlayerCard() {
        players.forEach { player in
            print(player.showCards()!)
        }
    }
}
