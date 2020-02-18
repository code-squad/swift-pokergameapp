//
//  Participant.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/18.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Participant {
    private var cards = [Card]()
    
    func take(card: Card) {
        cards.append(card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> T) -> [T] {
        return cards.map { transform($0) }
    }
}

extension Participant: Equatable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.cards == rhs.cards
    }
}
