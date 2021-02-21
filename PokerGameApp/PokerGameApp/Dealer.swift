//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class Dealer {
    
    private var cardDeck = CardDeck()
    private var players = Players()
    public var hands = [[String]]()
    
    public func makeDeckForGame() {
        cardDeck.make()
    }
    
    public func distributeCard(playersNum: Int, cardStud: Int) {
        players.participatePlayer(num: playersNum)
        if cardDeck.deck.count > playersNum * cardStud {
            cardDeck.shuffle()
            for _ in 1...cardStud {
                for i in 0..<playersNum {
                    players.receiveCard(playerIndex: i, card: cardDeck.deck[0])
                    cardDeck.removeOne()
                }
                players.receiveCard(playerIndex: players.dealerIndex(), card: cardDeck.deck[0])
                cardDeck.removeOne()
            }
            players.printHand()
        } else {
            cardDeck.reset()
        }
        
        
    }
    
    public func receiveHandFromPlayers() {
        players.submitHandToDealer()
        hands = players.hands
    }
    
    public func resetDeck() {
        cardDeck.reset()
    }
    
}
