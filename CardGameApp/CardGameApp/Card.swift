//
//  Card.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    // Swift 는 클래스보다 구조체, enum 을 선호한다는 이야기를 들어서 nested enum 으로 구현해봤습니다.
    
    // nested Suit enumeration
    enum Suit: Character, CaseIterable {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    
        func getPoint () -> Int {
            switch self {
            case .clubs: return 4
            case .diamonds: return 3
            case .hearts: return 2
            case .spades: return 1
            }
        }
    }
    
    // nested Rank enumeration
    enum Rank: Int, CaseIterable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    
    // Card properties and methods
    private let rank: Rank, suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    func isEqualToRank (_ card: Card) -> Bool {
        return rank == card.rank
    }
    
    func isNextRankThan (_ card: Card) -> Bool {
        if rank == .two && card.rank == Rank.ace {
            return true
        }
        
        return rank == Rank(rawValue: card.rank.rawValue + 1)
    }
    
    func isHigherThan (_ card: Card) -> Bool {
        let rankPoint = rank.rawValue == 1 ? 13 : rank.rawValue
        let cardRankPoint = card.rank.rawValue == 1 ? 13 : card.rank.rawValue
        
        if rankPoint > cardRankPoint {
            return true
        }
        
        if rankPoint < cardRankPoint {
            return false
        }
        
        if suit.getPoint() > card.suit.getPoint() {
            return true
        }
        
        return false
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        switch(rank.rawValue) {
        case 1: return "\(suit.rawValue)A"
        case 11: return "\(suit.rawValue)J"
        case 12: return "\(suit.rawValue)Q"
        case 13: return "\(suit.rawValue)K"
        default: return "\(suit.rawValue)\(rank.rawValue)"
        }
    }
}
