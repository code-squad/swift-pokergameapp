//
//  Hands.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Hands {
    
    enum TexasHoldemRule: Int, CaseIterable {
        case none
        case pair
        case triple
        case fourCard
        case twoPair
        case straight
        
        init(index: Int) {
            switch index {
            case 2:
                self = .pair
            case 3:
                self = .triple
            case 4:
                self = .fourCard
            default:
                self = .none
            }
        }
        
        func compare(with value: Int) -> Int {
            value < self.rawValue ? self.rawValue : value
        }
        
        func findPlayer(with value: Int) -> Bool {
            value == self.rawValue
        }
    }
    
    private var cards: [Card] = []
    var count: Int {
        cards.count
    }
    var grade: TexasHoldemRule {
        configureGrade()
    }
    var topValue: Int {
        configureDictionary().keys.sorted { $0 > $1 }.first ?? 0
    }
    
    func forEach(handler: (Card) -> Void) {
        cards.forEach { handler($0) }
    }
    
    func compare(with counting: Int) -> Int {
        grade.compare(with: counting)
    }
    
    func findPlayer(with value: Int) -> Bool {
        grade.findPlayer(with: value)
    }
    
    mutating func add(_ card: Card?) {
        guard let card = card else { return }
        cards.append(card)
    }
    
    mutating func removeLast() {
        cards.removeLast()
    }
    
    mutating func clearCards() {
        cards = []
    }
    
    private func configureGrade() -> TexasHoldemRule {
        let dictionary = configureDictionary()
        var grade: TexasHoldemRule = .none
        grade = applyRules(dictionary: dictionary)
        findTwoPair(grade: &grade, dictionary: dictionary)
        findStraight(grade: &grade, dictionary: dictionary)
        return grade
    }
    
    private func configureDictionary() -> [Int: Int]{
        var dictionary: [Int: Int] = [: ]
        cards.forEach { $0.configureDictionary(dictionary: &dictionary) }
        return dictionary
    }
    
    private func applyRules(dictionary: [Int: Int]) -> TexasHoldemRule {
        TexasHoldemRule(index: dictionary.values.sorted { $0 > $1 }.first ?? 0)
    }
    
    private func findTwoPair(grade: inout TexasHoldemRule, dictionary: [Int: Int]) {
        var count = 0
        let twoPair = 2
        dictionary.values.forEach { $0 == twoPair ? count += 1 : nil }
        grade == .pair && count > 1 ? grade = .twoPair : nil
    }
    
    private func findStraight(grade: inout TexasHoldemRule ,dictionary: [Int: Int]) {
        dictionary.forEach { key, _ in
            if dictionary[key - 2] != nil && dictionary[key - 1] != nil && dictionary[key + 1] != nil && dictionary[key + 2] != nil {
                grade = .straight
            }
        }
    }
}
