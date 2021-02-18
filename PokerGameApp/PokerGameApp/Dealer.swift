//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Dealer: Player {
    private var cardDeck = CardDeck()

    override init(name: PlayerType) {
        super.init(name: name)
    }
    // 카드를 나눠주는 함수 -> 그럼 매개변수로 participants 를 받아야겠지 ?
    func distributeCard(participants: Participants, numOfCard: Int) {
        cardDeck.reset()
        cardDeck.shuffle()
        
        for _ in 1...numOfCard {
            if let selectedCard = cardDeck.removeOn() {
                self.receiveCard(selectedCard)
            } else {
                return
            }
            
            for _ in 0..<participants.count {
                if let selectedCard = cardDeck.removeOn() {
                    participants.receiveCard(selectedCard)
                } else {
                    return
                }
            }
        }
        
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
