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
        dealer.receiveCard(gameType: gameType, players: players)
    }
    
    func resetCard() {
        dealer.resetPlayerCard(players: players)
    }
    
    func showPlayerCard() {
        players.enumerated().forEach { player in
            print(printResult(player: player.element))
        }
    }
    
    private func printResult(player : Playable) -> String {
        return "\(player.showCards())"
    }
    
    func totalPlayer() -> Int {
        return players.count
    }
}
