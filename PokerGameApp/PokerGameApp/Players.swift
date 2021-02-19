//
//  Players.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/19.
//

import Foundation

class Players {
    private var cardDeck = CardDeck()
    private(set) var players: [Player] = []
    lazy var count = players.count
    var description: String {
        var description = ""
        players.forEach { player in
            description += "\(player.description)\n"
        }
        return description
    }
    
    init(players: [Player]) {
        self.players = players
        cardDeck.shuffle()
    }
    
    func setHandCard(rule: PokerGame.Rule) {
        (1...rule.rawValue).forEach { _ in
            handout()
        }
    }
    
    func reset() {
        cardDeck.reset()
        players.forEach { player in
            player.reset()
        }
    }
    
    private func handout() {
        players.forEach { player in
            guard let card = cardDeck.removeOne() else {
                print("카드 부족")
                return
            }
            player.receive(card: card)
        }
    }
}
