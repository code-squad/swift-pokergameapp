//
//  HandCombination.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

enum Combination: Int {
    case OnePair = 1, TwoPair, Triple, Straight, FourCard
    func tellScore() -> Int{
        return self.rawValue
    }
}
