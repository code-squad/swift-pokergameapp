//
//  Hand.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Hand {
    private var cards = [Card]()
    private lazy var score = Score(cards: cards)
    private lazy var ranks = Ranks(cards: cards)
    
    func forEach(_ transform: (Card) -> ()) {
        cards.forEach(transform)
    }
    
    func add(card: Card) {
        cards.append(card)
    }
}

extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        lhs.score == rhs.score && lhs.ranks == rhs.ranks
    }
    
    static func > (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.score == rhs.score {
            return lhs.ranks > rhs.ranks
        }
        return lhs.score > rhs.score
    }
}
