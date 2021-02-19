//
//  Players.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Players {
    let playerNum: PlayerNumber
    var players: [Player] = []
    
    init(playerNum: PlayerNumber) {
        self.playerNum = playerNum
        for number in 1...playerNum.rawValue {
            players.append(Player(index: number))
        }
    }

    func getCard(from dealer: Dealer) {
        players.forEach { player in
            player.getCard(from: dealer.deal())
        }
    }
    
    func betting(who: PlayerNumber, money: Int) {
        players[who.rawValue - 1].bet(money: money)
    }
    
    func showCards() -> [Card] {
        var allCards = [Card]()
        players.forEach { player in
            allCards += player.cards
        }
        return allCards
    }
    
    func checkMoney() -> [Int] {
        var bettingArr = [Int]()
        players.forEach { player in
            bettingArr.append(player.betting)
        }
        return bettingArr
    }

    func openCards() {
        players.forEach { player in
            player.openCards()
        }
    }
    
}
