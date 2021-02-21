//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class Dealer {
    
    var cardDeck = CardDeck()
    var players = Players()
    
    public var cardStud = 5
    
    public func makeDeckForGame() {
        cardDeck.make()
    }

    public func distributeCard() {
        players.participatePlayer()
        cardDeck.shuffle()
        for _ in 1...cardStud {
            for i in 0..<players.playerNum {
                players.receiveCard(playerIndex: i, card: cardDeck.deck[0])
                cardDeck.removeOne()
            }
            players.receiveCard(playerIndex: players.dealerIndex(), card: cardDeck.deck[0])
            cardDeck.removeOne()
        }
        players.printHand()
    }
    
}
