//
//  CardGamePlay.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation


class CardGamePlay {
    var dealer = Dealer.init()
    var players: [Playable] = [Playable]()
    var gameType : GameType
    var playerCount: Int
    
    func playGame(){
        players.forEach { (player) in
            player.resetHand()
        }
        dealer.distributeCards(players, gameType: gameType)
        OutputView.printOutput(players)
        guard let winner = GameResult.init(players)?.selectWinnerName() else {
            return
        }
        print(winner.name, winner.type)
    }
    
    
    init(_ number: Int, gameType: GameType = GameType.fiveCard){
        self.playerCount = number
        self.gameType = gameType
        for index in 1..<playerCount {
            let player = Player.init("Player\(index)")
            players.append(player)
        }
        players.append(dealer)
    }
}
