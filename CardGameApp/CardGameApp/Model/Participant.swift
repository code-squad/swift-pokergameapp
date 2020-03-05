//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Card.Number: Comparable {
    static func < (lhs: Card.Number, rhs: Card.Number) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    func isEqual(other: Card.Number, distance: Int) -> Bool {
        return self.rawValue == other.rawValue + distance
    }
}

class Participant {
    
    private var cards = [Card]()
    let name: String
    var cardsCount: Int {
        return cards.count
    }
    var ranks = [Rank]()
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        cards = [Card]()
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    private(set) var isWinner = false
    func setWinner() {
        isWinner = true
    }
}

extension Participant: CardSearchable {
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach{ handler($0) }
    }
    
}

extension Participant {
    
    func updateRanks() {
        ranks = Rank.checkCombiAndGenerateRanks(with: cards)
    }
}
