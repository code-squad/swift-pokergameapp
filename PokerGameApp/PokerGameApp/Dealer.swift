//
//  File.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/19.
//

import Foundation

class Dealer: CardDeck {
    override init() {
        super.init()
        makeCards()
        shuffle()
    }
    // giveCard로 두 함수를 합치고 싶다
    func giveCardToPlayer(rule: Int, player: Player) {
        for _ in 0..<rule {
            if let card = self.removeOne() {
                player.getCard(newCard: card)
            } else {
                print("카드가 없습니다.\n")
            }
        }
    }
    
    func giveCardToDealer(rule: Int) {
        for _ in 0..<rule {
            if let card = self.removeOne() {
                self.getCard(newCard: card)
            } else {
                print("카드가 없습니다.\n")
            }
        }
    }
    
}
