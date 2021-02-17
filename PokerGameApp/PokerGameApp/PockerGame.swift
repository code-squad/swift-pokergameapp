//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class PockerGame {
    private var deck: CardDeck
    private var dealer: Dealer
    private var participants: [Participant] = []
    private var numOfParticipant: Int
    private var numOfCard: Int
    
    init(numOfParticipant: Int, numOfCard: Int) {
        self.numOfParticipant = numOfParticipant
        self.numOfCard = numOfCard
        deck = CardDeck()
        dealer = Dealer()
        //participants = Array(repeating: Participant(), count: self.numOfParticipant)
        for _ in 1...numOfParticipant {
            let participant = Participant()
            self.participants.append(participant)
        }
    }
    
    func distributeCard() {
        deck.shuffle()
        for _ in 1...numOfCard {
            if let selectedCard = deck.removeOn() {
                // 딜러에게 한장나눠준다.
                dealer.receiveCard(selectedCard)
            } else {
                print("카드가 다 소모되었습니다.\n 게임을 종료합니다.")
                return
            }

            participants.forEach({ participant in
                if let selectedCard = deck.removeOn() {
                    participant.receiveCard(selectedCard)
                } else {
                    print("카드가 다 소모되었습니다.\n 게임을 종료합니다.")
                    return
                }
            })
        }
    }
}
extension PockerGame: CustomStringConvertible {
    var description: String {
        var str = ""
        for num in 1...participants.count {
            str.append("참가자#\(num) \(participants[num-1])")
        }

        str.append("딜러 \(dealer))")
        return str
    }
}
