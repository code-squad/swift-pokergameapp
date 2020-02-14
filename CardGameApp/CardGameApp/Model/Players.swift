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
    
    func whoIsWinner() {
        let result = list.map { $0.score }.sorted { (lhs, rhs) -> Bool in
            if lhs.0 == rhs.0 {
                return lhs.1 > rhs.1
            } else {
                return lhs.0 > rhs.0
            }
        }
        list.forEach {
            if $0.score == result[0] {
                $0.isWinner = true
            }
        }
    }
}
