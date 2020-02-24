//
//  Players.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/17.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Players {
    enum Number: Int {
        case two = 2
        case three = 3
        case four = 4
        
        func invokePerPlayerCount<T>(_ block: () -> T) -> [T] {
            return (0..<rawValue).map { _ in block() }
        }
    }
    
    private let players: [Participant]
    
    var count: Int {
        return players.count
    }
    
    init(with number: Number) {
        self.players = number.invokePerPlayerCount { Participant() }
    }
    
    @discardableResult
    func repeatForEachPlayer<T>(_ transform: (Participant) -> T) -> [T] {
        return players.map { transform($0) }
    }
}

extension Players {
    func theHighest(in scores: [Score]) -> (Score, Card) {
        let highestScore = scores.max() ?? Score.none
        let highestCard = scores.filter { $0 == highestScore }
            .map { $0.highestCard }
            .compactMap { $0 }
            .max()!
        return (highestScore, highestCard)
    }
}

extension Players.Number: CaseIterable, Comparable {
    static func < (lhs: Players.Number, rhs: Players.Number) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    static func invokePerMaxParticipantNumber(_ block: () -> ()) {
        return (0..<allCases.max()!.rawValue + 1).forEach { _ in block() }
    }
}
