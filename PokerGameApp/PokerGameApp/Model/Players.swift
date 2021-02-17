//
//  Players.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/17.
//

import Foundation


class Players {
    private var players = [Playable]()
    private let dealer = Dealer()
    
    func addPlayer(particpatin : Int) {
        (1...particpatin).forEach { number in
            players.append(Player(entryNumber: number))
        }
        players.append(dealer)
    }
    
    func drawCard(gameType : Int) {
        dealer.shareCard(gameType: gameType, players: players)
    }
    
    func resetCard() {
        dealer.resetPlayerCard(players: players)
    }
    
    func showPlayerCard() -> String {
        var showcard = ""
        players.enumerated().forEach { player in
            showcard += "\(printResult(player: player.element))\n"
        }
        return showcard
    }
    
    private func printResult(player : Playable) -> String {
        return "\(player.showCards())"
    }
    
    func countCardDeck(gameType : Int) -> Bool {
        return dealer.count(gameType : gameType ,players : numberOfPlayer())
    }
    
    private func numberOfPlayer() -> Int {
        return players.count
    }
}
