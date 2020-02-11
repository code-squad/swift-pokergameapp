//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player: Playable {
    internal var hands: [Card]
    
    init(hands: [Card]) {
        self.hands = hands
    }
}

protocol Playable {
    var hands: [Card] { get set }
}
