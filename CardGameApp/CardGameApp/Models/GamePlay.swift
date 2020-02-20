//
//  GamePlay.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class GamePlay {
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        func invokePerRule(_ block: () -> ()) {
            (0..<rawValue).forEach { _ in block() }
        }
    }
    
    private let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    private var cardDeck: CardDeck
    private var winners: [Bool]?
    
    var participantCount: Int {
        return players.count + 1
    }
    
    init(rule: Rule, numberOfPlayers: Players.Number, cardDeck: CardDeck) {
        self.rule = rule
        self.players = Players(with: numberOfPlayers)
        self.cardDeck = cardDeck
    }
    
    func deal() {
        rule.invokePerRule {
            players.repeatForEachPlayer { $0.take(card: cardDeck.removeOne()) }
            dealer.take(card: cardDeck.removeOne())
        }
    }
    
    func decideWinner() {
        var scores = players.repeatForEachPlayer { $0.score() }
        scores.append(dealer.score())
        
        let maxScore = scores.max() ?? Score.none
        let highestCardOfSemiWinners: [Card?] = scores.map { score in
            if score.isSamePriority(with: maxScore) { return score.highestCard }
            return nil
        }
        
        let highestCard = highestCardOfSemiWinners.compactMap { $0 }.max()
        winners = highestCardOfSemiWinners.map {
            if let card = $0, card == highestCard { return true }
            return false
        }
    }
    
    func isWinner(_ block: (Bool) -> ()) {
        winners?.forEach { block($0) }
    }
    
    func repeatForEachParticipant(_ block: (Participant) -> ()) {
        players.repeatForEachPlayer { block($0) }
        block(dealer)
    }
}
