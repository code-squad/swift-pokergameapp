//
//  Players.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/13.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Players{
    private var players: [Player] = [Player]()
    
    func append(_ player: Player){
        players.append(player)
    }
    
    func forEachPlayer(_ transform: (Player) -> ()){
        players.forEach{
            transform($0)
        }
    }
    
    func count() -> Int{
        return players.count
    }
}


