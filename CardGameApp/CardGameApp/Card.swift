//
//  Card.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Card {
    var shape: Shape
    var rank: Rank

    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    enum Shape: String {
        case heart = "♥︎", spade = "♠︎", clover = "♣︎", diamond = "♦︎"
    }
    
    //
    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
    
    func getInfo() -> String {
        var info = shape.rawValue
        switch rank {
        case .A, .J, .Q, .K:
            info += "\(rank)"
        default:
            info += "\(rank.rawValue)"
        }
        return info
    }
}
