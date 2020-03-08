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

class HandCombination{
    var combinedCardsRank = [Int]() // 조합을 이룬 카드들의 Rank
    var combinationTypes = [Int]() // 참가자가 갖고있는 카드들 중 각 조합을 이루기 위한 카드는 몇개였는지 (ex - Triple = 3, Straight = 5)
    var isOnePair : Bool = false
    var typesOfCombination = [Combination]() // 참가자가 갖고있는 카드들이 어떤 조합이 나왔는지
}
