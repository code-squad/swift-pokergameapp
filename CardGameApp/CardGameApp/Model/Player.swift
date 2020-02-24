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
    var count: Int {
        return cards.count
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func addCard(card: Card?) {
        cards.add(card)
    }
    
    func printCard() {
        cards.printCard { result in
            print(result)
        }
    }
}
