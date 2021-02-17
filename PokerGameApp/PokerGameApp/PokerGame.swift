//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame: CustomStringConvertible {
    
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
    var description: String {
        var playerIndex = 0
        let playersResult: String = getPlayersResult().map {
            playerIndex += 1
            return "참가자\(playerIndex): \($0)"
        }.joined(separator: "\n")
        let dealerResult: String = "딜러: \(getDealerResult())"
        return "🃏카드게임 종류: \(gameType), 👨‍👩‍👧‍👦참가자: \(players.count)명\n\(playersResult)\n\(dealerResult)"
    }
    
    init(dealer: Dealer, players: [Player], gameType: StudPoker) throws {
        guard players.count >= GameRule.minPlayer.getNumber() else {
            throw PokerGameError.tooFewPlayers
        }
        
        guard players.count <= GameRule.maxPlayer.getNumber() else {
            throw PokerGameError.tooManyPlayers(playersNeededToLeave: players.count - GameRule.maxPlayer.getNumber())
        }
        
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

enum PokerGameError: Error {
    case tooFewPlayers
    case tooManyPlayers(playersNeededToLeave: Int)
}
