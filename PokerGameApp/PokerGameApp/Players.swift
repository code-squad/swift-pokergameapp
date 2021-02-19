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
    var count: Int
    var description: String {
        var description = ""
        players.forEach { player in
            description += "\(player.description)\n"
        }
        return description
    }
    
    init(count: Int) {
        self.count = count
        cardDeck.shuffle()
        setPlayers()
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
    
    func setPlayers() {
        var players: [Player] = []
        (1...count).forEach { _ in
            players.append(Player())
        }
        players.append(Player(playerType: .dealer))
        self.players = players
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
