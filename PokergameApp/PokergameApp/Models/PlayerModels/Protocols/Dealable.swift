//
//  Dealable.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

protocol Dealable {
    func distributeCards(_ players: [Playable], gameType: GameType)
    
}
