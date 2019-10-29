//
//  CardGame.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

typealias resultNameCard = (String, String) -> Void
typealias resultName = (String) -> Void

import Foundation

//GameMode : 1번을 누르면 7장 카드 , 2번을 누르면 5장의 카드를 출력하기 위해
enum GameMode: Int, CaseIterable {
    case sevenCard = 1 , fiveCard
    
    var modeCardNumber: Int {
        switch self {
        case .sevenCard:
            return 7
        case .fiveCard:
            return 5
        }
    }
}

protocol GamePlayer {
    func take(card: Card)
    func showCards() -> String
    func resetCards()
    var name: String { get }
    var winnerHand: HandBetting? { get }
}

class CardGame {
    private let gameMode: GameMode
    let gameMakePlays: GameMakePlayers
    
    init(gameMode: GameMode, players: Int){
        self.gameMode = gameMode
        let make = GameMakePlayers.init(players: players)
        self.gameMakePlays = make
    }
    
    private func reset() {
        gameMakePlays.gamePlayersReset()
    }
    
    func play() -> Bool {
        reset()
        guard gameMakePlays.sendRound(gameMode.modeCardNumber) else { return false }
        return true
    }

    private func deal(_ cards: resultNameCard) -> Bool {
        for _ in 0..<gameMode.modeCardNumber {
            guard gameMakePlays.sendRoundCards(cards) else { return false }
        }
        return true
    }
    
    func play(_ cards: resultNameCard, _ winner: resultName) -> Bool {
        reset()
        guard gameMakePlays.isLimitCards(gameMode) else { return false }
        guard deal(cards) else { return false }
        
        gameMakePlays.winnerNameStorage(winner)
        return true
    }
    
    
}
