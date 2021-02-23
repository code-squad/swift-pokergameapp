//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/17.
//

import Foundation

enum GameType: Int, CaseIterable {
    case seven = 7
    case five = 5
}

enum Participant: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
}

class PokerGame {
    private(set) var players: Players
    private var dealer: Dealer
    
    init(players: Players, dealer: Dealer) {
        self.players = players
        self.dealer = dealer
    }
    
    func startGame() {
        dealer.readyToStart()
        dealer.deal(to: players)
    }
    
    func printParticipantCards() {
        players.printPlayerCards()
        dealer.printDealerCards()
    }
}
