//
//  Players.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Players {
    enum NumberOfPlayers: Int, CaseIterable {
        case two = 2
        case three = 3
        case four = 4
        
        init(index: Int) {
            self = NumberOfPlayers.allCases[index]
        }
        
        func forEach(_ transform: () -> ()) {
            for _ in 1...self.rawValue {
                transform()
            }
        }
    }

    private var list = [Player]()
    var count: Int {
        list.count
    }
    
    func addPlayers(count: NumberOfPlayers) {
        count.forEach {
            list.append(Player(number: list.count + 1))
        }
        list.append(Dealer())
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
