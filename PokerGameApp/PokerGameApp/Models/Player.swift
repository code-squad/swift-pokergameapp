//
//  Player.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

protocol Participant {
    var nickname: String { get }
    
    func dealt(_ card: Card)
    func cardsCount() -> Int
    func tellCard(at index: Int) -> Card
}

class Player: Participant {
    
    private(set) var nickname: String
    private var cards: [Card]
    
    init(nickname: String) {
        self.nickname = nickname
        self.cards = []
    }
    
    func dealt(_ card: Card) {
        self.cards.append(card)
    }
    
    func cardsCount() -> Int {
        cards.count
    }
    
    func tellCard(at index: Int) -> Card {
        return cards[index]
    }
}
