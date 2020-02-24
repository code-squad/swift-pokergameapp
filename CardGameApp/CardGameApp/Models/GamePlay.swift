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
        var scores = players.repeatForEachPlayer { $0.score() } + [dealer.score()]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        players.repeatForEachPlayer { player in
            player.markIfWinner { scores.popFirst()!.isSame(with: highestScore, card: highestCard) }
        }
        dealer.markIfWinner { scores.last!.isSame(with: highestScore, card: highestCard) }
    }
    
    func repeatForEachParticipant(_ block: (Participant) -> ()) {
        players.repeatForEachPlayer { block($0) }
        block(dealer)
    }
}

extension GamePlay.Rule: CaseIterable, Comparable {
    static func < (lhs: GamePlay.Rule, rhs: GamePlay.Rule) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    static func invokePerMaxParticipantNumber(_ block: () -> ()) {
        return (0..<allCases.max()!.rawValue).forEach { _ in block() }
    }
}
