//
//  Gamer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class Player {
    
    private var cards: Hands = Hands()
    private var identifier: String
    var count: Int {
        return cards.count
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func applyIdentifier(label: UILabel) {
        label.text = identifier
    }
    
    func addCard(card: Card?) {
        cards.add(card)
    }
    
    func removeLast() {
        cards.removeLast()
    }
}
