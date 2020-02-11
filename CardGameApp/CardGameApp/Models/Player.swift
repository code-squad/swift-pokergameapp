//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player {
    private var _hands: [Card]
    
    var hands: [Card] {
        _hands
    }
    
    var numberOfHands: Int {
        _hands.count
    }
    
    init(hands: [Card]) {
        self._hands = hands
    }
}
