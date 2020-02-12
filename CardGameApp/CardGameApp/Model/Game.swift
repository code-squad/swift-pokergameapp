//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol CustomIntegerConvertible {
    var description: Int { get }
}

//MARK: - Game
class Game {
    
    enum style {
        case five
        case seven
    }
    
    var attendies: [Gamer] = []
    var style: style
    
    init(person: Int, style: style){
        if person < 5 && person > 0 {
            attendies = (1...person).map { name in
                Gamer(identifier: String(name))
            }
        }
        self.style = style
    }
}

//MARK: - Gamer
class Gamer {
    var identifier: String
    var cards: [Card] = []
    
    init(identifier: String) {
        self.identifier = identifier
    }
}

//MARK: - Extension
//MARK: Game.style
extension Game.style: CustomIntegerConvertible {
    var description: Int {
        switch self {
        case .five: return 5
        case .seven: return 7
        }
    }
}
