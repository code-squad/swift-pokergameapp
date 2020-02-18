//
//  Hand.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/18.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Hand {
    private var cards = [Card]()
    
    func add(card: Card) {
        cards.append(card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> (T)) -> [T] {
        return cards.map { transform($0) }
    }
}

extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}
