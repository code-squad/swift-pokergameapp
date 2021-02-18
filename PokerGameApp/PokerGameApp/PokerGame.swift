//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame: CustomStringConvertible {
    
    enum GameRule: Int {
        case minPlayer = 1
        case maxPlayer = 4
        
        func isSatisfied(_ players: Players) throws {
            switch self {
            case .minPlayer:
                guard players.count >= self.rawValue else {
                    throw PokerGameError.tooFewPlayers
                }
            case .maxPlayer:
                guard players.count <= self.rawValue else {
                    throw PokerGameError.tooManyPlayers(playersNeededToLeave: players.count - self.rawValue)
                }
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
    
    enum PokerGameError: Error {
        case tooFewPlayers
        case tooManyPlayers(playersNeededToLeave: Int)
    }
    
    private let dealer: Dealer
    private let players: Players
    private let gameType: StudPoker
    var description: String {
        var playerIndex = 0
        let playersResult: String = getPlayersResult().map {
            playerIndex += 1
            return "참가자\(playerIndex): \($0)"
        }.joined(separator: "\n")
        let dealerResult: String = "딜러: \(getDealerResult())"
        return "🃏카드게임 종류: \(gameType), 👨‍👩‍👧‍👦참가자: \(players.count)명\n\(playersResult)\n\(dealerResult)"
    }
    
    init(dealer: Dealer, players: Players, gameType: StudPoker) throws {
        try GameRule.minPlayer.isSatisfied(players)
        try GameRule.maxPlayer.isSatisfied(players)
        
        self.dealer = dealer
        self.players = players
        self.gameType = gameType
    }
    
    func startGame() {
        dealer.shuffleCardDeck()
        (0..<gameType.getMaxCardCounts()).forEach { _ in
            let cards = dealer.deal(to: players).compactMap { $0 }
            players.dealt(cards)
            if let card = dealer.deal() {
                dealer.dealt(card)
            }
        }
    }
    
    private func getPlayersResult() -> [[Card]] {
        return players.showdown()
    }
    
    private func getDealerResult() -> [Card] {
        return dealer.showdown()
    }
}
