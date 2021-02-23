//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class PokerGame {
    
    enum GameType: Int, CaseIterable {
        case five = 5
        case seven = 7

        var value: Int {
            return self.rawValue
        }
    }

    enum PlayerNumber: Int, CaseIterable {
        case one = 1, two, three, four
        
        var value: Int {
            return self.rawValue
        }
    }
    
    private var dealer = Dealer()
    private var players = Players()
    private var gameType: GameType
    private var isEndGame: Bool
    
    init(playerNumber: PlayerNumber, gameType: GameType) {
        self.gameType = gameType
        self.isEndGame = false
        players.takeSeat(with: playerNumber)
    }
    
    public func shareCards() {
        dealer.distributeCard(players, numberOfCards: gameType)
    }
    
    public func showPlayersCard(closure: (Players) -> ()) {
        closure(players)
    }
    
    public func showDealerCard(closure: (Dealer) -> ()) {
        closure(dealer)
    }
    
    public func resetGame() {
        players.dropAllCard()
        dealer.dropMyCards()
        dealer.resetCardDeck()
        shareCards()
    }

    public func startGame() {
        shareCards()
    }
}
