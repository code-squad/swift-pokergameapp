//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Playerable {
    func receiveCard(sender : () -> (Card))
}

class Player : Playerable , Searchable {
    
    private var cards : [Card]?
    
    func receiveCard(sender: () -> (Card)) {
        cards?.append(sender())
    }
    
    func searchCard(handler: (Card) -> ()) {
        if let cards = cards {
            _ = cards.map { handler($0) }
        }
    }
}


