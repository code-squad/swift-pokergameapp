//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

protocol PokerGame {
    
    init(dealer: Dealer, players: [Player])
    
    func run()
}

class FiveCardStud: PokerGame {
    required init(dealer: Dealer, players: [Player]) {
        
    }
    
    func run() {
        
    }
    
    
}

class SevenCardStud: PokerGame {
    required init(dealer: Dealer, players: [Player]) {
        
    }
    
    func run() {
        
    }
    
    
}
