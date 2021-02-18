//
//  Participant.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Participant: Player {
    override init(name: String) {
        super.init(name: name)
    }
}
//extension Participant: CustomStringConvertible {
//    var description: String {
//        var str = cards.map({"\($0)"}).joined(separator: " ,")
//        str.insert("[", at: str.startIndex)
//        str.append("]\n")
//        return str
//    }
//}
