//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame: CustomStringConvertible {
    
    enum Size: Int, CustomStringConvertible {
        case twoPlayers = 2, threePlayers, fourPlayers
        
        var description: String {
            switch self {
            case .twoPlayers:
                return "2명"
            case .threePlayers:
                return "3명"
            case .fourPlayers:
                return "4명"
            }
        }
    }
    
    enum StudPoker: Int, CustomStringConvertible {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        var description: String {
            switch self {
            case .fiveCardStud:
                return "5 Cards"
            case .sevenCardStud:
                return "7 Cards"
            }
        }
        
        var cardRange: Range<Int> {
            return 0..<self.rawValue
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
    
    init(dealer: Dealer, players: Players, gameType: StudPoker) {
        self.dealer = dealer
        self.players = players
        self.gameType = gameType
    }
    
    func startGame() {
        dealer.shuffleCardDeck()
        gameType.cardRange.forEach { _ in
            let cards = dealer.deal(to: players).compactMap { $0 }
            players.dealt(cards)
            if let card = dealer.deal() {
                dealer.dealt(card)
            }
        }
    }
    
    func getPlayersResult() -> [[Card]] {
        return players.showdown()
    }
    
    func getDealerResult() -> [Card] {
        return dealer.showdown()
    }
}
