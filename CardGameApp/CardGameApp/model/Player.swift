//
//  Player.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Player {
    private var handDeck = [Card?]()
    
    func bringCard(card: Card?){
        self.handDeck.append(card)
    }
}
