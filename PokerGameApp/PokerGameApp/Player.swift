//
//  Player.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/17.
//

import Foundation

class Players {
    private var cardDeck = CardDeck()
    private var players: [Player] = []
    
    lazy var count = players.count
    
    init(players: [Player]) {
        self.players = players
        cardDeck.shuffle()
    }
    
    func setHandCard(rule: PokerGame.Rule) {
        (1...rule.rawValue).forEach { _ in
            handout()
        }
        players.forEach { player in
            print(player.handCard)
        }
    }
    
    private func handout() {
        players.forEach { player in
            guard let card = cardDeck.removeOne() else {
                print("카드가 부족해 게임을 종료합니다.")
                return
            }
            player.receive(card: card)
        }
    }

}

class Player {
    enum PlayerType {
        case dealer
        case player
    }
    
    var handCard: [Card] = []
    private var playerType: PlayerType
    
    init(playerType: PlayerType = .player) {
        self.playerType = playerType
    }
    
    func receive(card: Card) {
        handCard.append(card)
    }
    
    func reset() {
        handCard.removeAll()
    }
}
