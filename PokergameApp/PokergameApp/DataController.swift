//
//  DataController.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class DataController {
    private var cardGamePlay = CardGamePlay(number: PlayerType.three, gameType: .sevenCard)
    
    init(playStyle: CardGamePlay){
        cardGamePlay = playStyle
    }
    
    
}
