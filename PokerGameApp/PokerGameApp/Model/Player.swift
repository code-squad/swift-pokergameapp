//
//  Player.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

protocol Player {

    func receiveCard(_ card: Card)
    func eachCard(method: (Card)->())
    func resetCard()
    
}

//class Player {
//    private var cards: [Card] = []
//    private var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func receiveCard(_ card: Card) {
//        cards.append(card)
//    }
//    
//    func eachCard(method: (Card)->()) {
//        cards.forEach({method($0)})
//    }
//    
//    func resetCard() {
//        cards.removeAll()
//    }
//    
//}
