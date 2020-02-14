//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Game {
    
    enum Style {
        case five
        case seven
    }
    
    private var gamers: [Gamer] = []
    private var dealer: Dealer = Dealer()
    private var style: Style
    
    
    init(gamers: [Gamer], style: Style){
        self.gamers = gamers
        self.gamers.append(dealer)
        self.style = style
        distributeByNubmers()
    }
    
    private func distributeByNubmers() {
        (1...style.description).forEach { _ in
            distributeCard()
        }
    }
    
    private func distributeCard() {
        gamers.forEach { gamer in
            gamer.addCard(card: dealer.pushCard())
        }
    }
}

extension Game.Style: CustomIntegerConvertible {
    var description: Int {
        switch self {
        case .five: return 5
        case .seven: return 7
        }
    }
}
