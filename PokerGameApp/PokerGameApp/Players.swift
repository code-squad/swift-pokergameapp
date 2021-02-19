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
    
    func setHandCard(rule: PokerGame.Rule) throws {
        try (1...rule.rawValue).forEach { _ in
            try handout()
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
    
    private func handout() throws {
        try players.forEach { player in
            guard let card = cardDeck.removeOne() else {
                throw CardDeckError.emptyCardDeck
            }
            player.receive(card: card)
        }
    }
}

enum CardDeckError: Error {
    case emptyCardDeck
}
