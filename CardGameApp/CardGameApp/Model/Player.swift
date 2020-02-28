//
//  Gamer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Player {
    
    private var cards: Hands = Hands()
    private var identifier: String
    var winner: Bool = false
    var description: String {
        return identifier
    }
    var topValue: Int {
        cards.topValue
    }
    var count: Int {
        return cards.count
    }
    var grade: Hands.TexasHoldemRule {
        cards.grade
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func addCard(card: Card?) {
        cards.add(card)
    }
    
    func removeLast() {
        cards.removeLast()
    }
    
    func clearCards() {
        cards.clearCards()
    }
    
    func forEach(handler: (Card) -> Void) {
        cards.forEach { handler($0) }
    }
    
    func checkWinner() {
        winner.toggle()
    }
    
    func findPlayer(with value: Int) -> Bool {
        cards.findPlayer(with: value)
    }
    
    func compare(with value: Int) -> Int {
        cards.compare(with: value)
    }
}
