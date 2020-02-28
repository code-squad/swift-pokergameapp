//
//  Card.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Card {
    
    enum suit: CaseIterable {
        case spade
        case heart
        case club
        case diamond
    }
    
    enum rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven = 11, twelve = 12, thirteen = 13
        
        func configureDictionary(dictionary: inout [Int: Int]) {
            let isEmpty = dictionary[self.rawValue] == nil
            let updateValue = (dictionary[self.rawValue] ?? 0) + 1
            dictionary.updateValue(isEmpty ? 1 : updateValue , forKey: self.rawValue)
        }
    }
    
    private var suit: suit
    private var rank: rank

    init(suit: suit, rank: rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func configureDictionary(dictionary: inout [Int: Int]) {
        self.rank.configureDictionary(dictionary: &dictionary)
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.suit.description + self.rank.description
    }
}

extension Card.rank: CustomStringConvertible {
    var description: String {
        switch self {
        case .one: return "A"
        case .eleven: return "J"
        case .twelve: return "Q"
        case .thirteen: return "K"
        default: return String(rawValue)
        }
    }
}

extension Card.suit: CustomStringConvertible {
    var description: String {
        switch self {
        case .club: return "c"
        case .diamond: return "d"
        case .heart: return "h"
        case .spade: return "s"
        }
    }
}
