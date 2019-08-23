//
//  Card.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private (set) var type : CardType
    private (set) var number : CardNumber
    
    init(type: CardType, number: CardNumber) {
        self.type = type
        self.number = number
    }
    var description : String {
        get {
            return "\(self.type.description)\(self.number.description)"
        }
    }
}
