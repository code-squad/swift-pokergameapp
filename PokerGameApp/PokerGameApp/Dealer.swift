//
//  File.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/19.
//

import Foundation

class Dealer: CardDeck {
    let rule: Rule
    let playerNumber: PlayerNumber
    var participants = [Player()]
    
    enum Rule: Int {
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum PlayerNumber: Int {
        case one = 1, two, three, four
    }
    
    init(rule: Int, playerNumber: Int, players: [Player]) {
        self.rule = Dealer.Rule(rawValue: rule)! // 이 부분 더 깔끔하게 표현하고 싶다..
        self.playerNumber = Dealer.PlayerNumber(rawValue: playerNumber+1)!
        super.init()
        
        makeCards()
        shuffle()
    }
    
    
    func giveCard() {
        for participant in participants {
            for _ in 0..<self.rule.rawValue {
                if let card = removeOne() {
                    participant.getCard(newCard: card)
                } else {
                    print("카드가 없습니다.\n")
                }
            }
        }
    }
}
