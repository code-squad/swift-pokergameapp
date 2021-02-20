//
//  Players.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class Players {
    private var players: Array<Player> = []
    
    init(numberOfPlayers: Int) {
        for i in 1...numberOfPlayers {
            players.append(Player(id: i))
        }
    }
    
    func cardForAll(cards: CardDeck) {
        for player in players {
            if let drawnCard = cards.removeOne() {
                player.receive(card: drawnCard)
            }
        }
    }
    
    func giveCardInfoOfPlayers() -> Array<Array<Card>> {
        var result: Array<Array<Card>> = []
        for player in players {
            result.append(player.cardInfo())
        }
        return result
    }
    
    public func resetPlayers() {
        players.forEach { (player) in
            player.resetPlayer()
        }
    }
}

extension Players: CustomStringConvertible {
    var description: String {
        var result = ""
        for player in players {
            result.append("\(player)\n")
        }
        return result
    }
}
