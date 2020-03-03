//
//  Gamer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Player {
    
    enum TexasHoldemRule: Int, CaseIterable {
        case none = 1
        case pair
        case triple
        case fourCard
        case twoPair
        case straight
    }
    
    private var cards: Hands = Hands()
    private var identifier: String
    private var winner: Bool = false
    var topValue: Int {
        return cards.topValue
    }
    var description: String {
        return identifier
    }
    var count: Int {
        return cards.count
    }
    var grade: TexasHoldemRule {
        calculateScore()
    }
    var winnerImageName: String? {
        winner ? "winner" : nil
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func addCard(card: Card?) {
        cards.add(card)
    }
    
    func removeLast() {
        cards.removeLast()
    }
    
    func clearCards() {
        cards.clearCards()
    }
    
    func forEach(handler: (Card) -> Void) {
        cards.forEach { handler($0) }
    }
    
    func toggleWinner() {
        winner.toggle()
    }
    
    func resetWinnerState() {
        winner = false
    }
    
    private func classificateSameRankCards() -> [Card.Rank: Int] {
        var dictionary: [Card.Rank: Int] = [: ]
        cards.forEach { card in
            let key: Card.Rank = Card.Rank(rawValue: card.value) ?? .one
            dictionary.updateValue(dictionary[key] == nil ? 1 : (dictionary[key] ?? 0) + 1 , forKey: key)
        }
        return dictionary
    }
    
    private func calculateScore() -> TexasHoldemRule {
        let dictionary = classificateSameRankCards()
        var grade = TexasHoldemRule(rawValue: dictionary.values.sorted { $0 > $1 }.first ?? 0) ?? .none
        grade = findTwoPair(dictionary: dictionary, grade: grade)
        grade = findStraight(dictionary: dictionary, grade: grade)
        return grade
    }
    
    private func findTwoPair(dictionary: [Card.Rank: Int], grade: TexasHoldemRule) -> TexasHoldemRule {
        var count = 0
        let twoPair = 2
        dictionary.values.forEach { $0 == twoPair ? count += 1 : nil }
        return grade == .pair && count > 1 ? .twoPair : grade
    }
    
    private func findStraight(dictionary: [Card.Rank: Int], grade: TexasHoldemRule) -> TexasHoldemRule {
        var grade = grade
        dictionary.keys.forEach {
            if dictionary[$0.neighborRank(index: -2)] != nil && dictionary[$0.neighborRank(index: -1)] != nil && dictionary[$0.neighborRank(index: 1)] != nil && dictionary[$0.neighborRank(index: 2)] != nil {
                grade = .straight
            }
        }
        return grade
    }
}

extension Player.TexasHoldemRule: Comparable {
    static func < (lhs: Player.TexasHoldemRule, rhs: Player.TexasHoldemRule) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    static func == (lhs: Player.TexasHoldemRule, rhs: Player.TexasHoldemRule) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.grade < rhs.grade
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.grade == rhs.grade
    }
}
