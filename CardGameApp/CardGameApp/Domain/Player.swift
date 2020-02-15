//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Playerable {
    func receiveCard(sender: () throws -> (Card)) throws
}

class Player: Playerable , Searchable {
    
    private var cards: [Card]?
    
    func receiveCard(sender: () throws -> (Card)) throws {
        cards?.append(try sender())
    }
    
    func searchCard(handler: (Card) -> ()) {
        if let cards = cards {
            _ = cards.map { handler($0) }
        }
    }
    
}


