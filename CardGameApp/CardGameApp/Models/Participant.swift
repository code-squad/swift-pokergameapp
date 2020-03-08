//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Participant {
    
    let name: String
    var cardsCount: Int {
        return cards.count
    }
    private var ranks: Ranks!
    private var cards = [Card]()
    
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        cards = [Card]()
        ranks = nil
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    func updateRanks() {
        ranks = Ranks(cards: cards)
    }
    
}

extension Participant: CardSearchable {
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach { handler($0) }
    }
    
}

extension Participant: Comparable {
    
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.ranks == rhs.ranks
    }
    
    static func < (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.ranks < rhs.ranks
    }
    
}

