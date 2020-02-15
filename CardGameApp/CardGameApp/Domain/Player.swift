//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Player : Searchable {
    private var cards : [Card]?
    
    func search(handler: (Card) -> ()) {
        if let cards = cards {
            _ = cards.map { handler($0) }
        }
    }
}


