//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class Dealer {
    
    let deck = CardDeck()
    let players = Players()
    
    public func makeDeck() {
        deck.make()
    }
    
    public func recruitPlayer(playerNum: Int) {
        players.participate(playerNum: playerNum)
    }
    
    public func shuffleDeck() {
        deck.shuffle()
    }
    
    public func distributeCard(playerNum: Int, cardStud: Int) {
        for _ in 1...cardStud {
            for j in 0...playerNum {
                players.receiveCard(index: j, card: deck.selectedCard())
                deck.removeSelectedCard()
            }
        }
    }
    
    public func retrieveInfo() -> [Player] {
        return players.submitInfo()
    }
    
    public func resetPlayer() {
        players.retrieveCard()
    }
    
}
