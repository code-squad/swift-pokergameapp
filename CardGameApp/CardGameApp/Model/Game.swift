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
    
    enum Style {
        case five
        case seven
    }
    
    private var attendies: [Gamer] = []
    private var style: Style
    
    init(person: Int, style: Style){
        if person < 5 && person > 0 {
            attendies = (1...person).map { name in
                Gamer(identifier: String(name))
            }
        }
        self.style = style
    }
    
    func takeInformation(handler: ([Gamer], Style) -> Void) {
        handler(attendies, style)
    }
}

//MARK: - Gamer
class Gamer {
    
    var count: Int {
        return cards.count
    }
    private var identifier: String
    private var cards: [Card] = []
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
    func printCard(handler: ([Card]) -> Void) {
        handler(cards)
    }
}

//MARK: - Extension
//MARK: Game.style
extension Game.Style: CustomIntegerConvertible {
    var description: Int {
        switch self {
        case .five: return 5
        case .seven: return 7
        }
    }
}
