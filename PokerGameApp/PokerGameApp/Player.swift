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
    
    private var playerType: PlayerType
    var handCard = HandCard()
    var description: String {
        return "\(playerType) \(handCard.description)"
    }
    
    init(playerType: PlayerType = .player) {
        self.playerType = playerType
    }
    
    func receive(card: Card) {
        handCard.append(card: card)
    }
    
    func reset() {
        handCard.reset()
    }
}

class HandCard {
    private var cards: [Card] = []
    var description: String {
        return cards.description
    }
    
    func append(card: Card) {
        cards.append(card)
    }
    
    func reset() {
        cards.removeAll()
    }
    
    func printCard() {
        print(cards)
    }
}
