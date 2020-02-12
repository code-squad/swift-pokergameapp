//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//
//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

//MARK: - Gamer
class Gamer {
    var identifier: String
    var cards: [Card] = []
    
    init(identifier: String) {
        self.identifier = identifier
    }
}
