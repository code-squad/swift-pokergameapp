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
    
    public var playerNum = 1
    public var cardStud = 5
    
    public func recruitPlayer() {
        for i in 1...playerNum {
            players.willJoinGame.append(Player(name: "Player\(i)", hand: []))
        }
        players.willJoinGame.append(Player(name: "Dealer", hand: []))
    }
    
    public func makeDeckForGame() {
        cardDeck.make()
    }

    public func distributeCard() {
        cardDeck.shuffle()
        for _ in 1...cardStud {
            for i in 0..<players.willJoinGame.count-1 {
                players.willJoinGame[i].hand.append(cardDeck.deck[0])
                cardDeck.removeOne()
            }
            players.willJoinGame[players.willJoinGame.endIndex-1].hand.append(cardDeck.deck[0])
            cardDeck.removeOne()
        }
        
        for j in 0..<players.willJoinGame.count {
            print(players.willJoinGame[j].hand)
        }
    }
    
}
