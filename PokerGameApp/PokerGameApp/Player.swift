//
//  Player.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//


import Foundation

//protocol ReceiveCardDelegate {
//    mutating func receiveCards(with rCards:[Card])
//}

class Player {
    private var cards: [Card] = []
    
    func receive(with rCards: [Card]) {
        self.cards = rCards
    }
    func playerDeck() -> [Card] {
        cards
    }
 
}
