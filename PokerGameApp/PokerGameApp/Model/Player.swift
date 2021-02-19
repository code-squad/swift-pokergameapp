//
//  Player.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

enum PlayerType: String {
    case Dealer = "딜러"
    case Pariticipant = "참가자"
}

class Player {
    private var cards: [Card] = [] 
    private var name: PlayerType
    
    init(name: PlayerType) {
        self.name = name
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func getCard() -> [Card] {
        return cards
    }
}
//// 데이터가 잘 들어갔나 확인용
//extension Player: CustomStringConvertible {
//    var description: String {
//        var str = self.getCard().map({"\($0)"}).joined(separator: " ,")
//        str.insert(contentsOf: "\(self.name.rawValue) [", at: str.startIndex)
//        str.append("]")
//        return str
//    }
//}
