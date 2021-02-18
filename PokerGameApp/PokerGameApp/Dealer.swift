//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Dealer: Player {

    override init(name: PlayerType) {
        super.init(name: name)
    }

}
//extension Dealer: CustomStringConvertible {
//    var description: String {
//        var str = cards.map({"\($0)"}).joined(separator: " ,")
//        str.insert("[", at: str.startIndex)
//        str.append("]")
//        return str
//    }
//}
