//
//  Players.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Players {
    private var list = [Player]()
    var count: Int {
        list.count
    }
    
    func add(player: Player) {
        list.append(player)
    }
    
    func discardAll() {
        list.forEach {
            $0.discard()
        }
    }
    
    func forEach(_ transform: (Player) -> ()) {
        list.forEach(transform)
    }
    
    func whoIsWinner() -> Int {
        let result = list.sorted { $0 > $1 }
        return list.firstIndex(of: result[0])!
    }
}
