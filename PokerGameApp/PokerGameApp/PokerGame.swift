//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame {
    
    enum GameRule {
        case minPlayer
        case maxPlayer
        
        func getNumber() -> Int {
            switch self {
            case .minPlayer:
                return 1
            case .maxPlayer:
                return 4
            }
        }
    }
    
    enum StudPoker: CustomStringConvertible {
        case fiveCardStud
        case sevenCardStud
        
        var description: String {
            switch self {
            case .fiveCardStud:
                return "5카드 스터드"
            case .sevenCardStud:
                return "7카드 스터드"
            }
        }
        
        func getMaxCardCounts() -> Int {
            switch self {
            case .fiveCardStud:
                return 5
            case .sevenCardStud:
                return 7
            }
        }
    }
    
    let dealer: Dealer
    let players: [Player]
    let gameType: StudPoker
    
    init(dealer: Dealer, players: [Player], gameType: StudPoker) {
        self.dealer = dealer
        self.players = players
        self.gameType = gameType
    }
    
    func startGame() {
        dealer.cardDeck.shuffle()
        (0..<gameType.getMaxCardCounts()).forEach { _ in
            dealer.deal(to: players)
            dealer.deal(to: dealer)
        }
    }
    
    func getPlayersResult() -> [[Card]] {
        return players.map { $0.showdown() }
    }
    
    func getDealerResult() -> [Card] {
        return dealer.showdown()
    }
}
