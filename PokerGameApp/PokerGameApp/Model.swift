//
//  Model.swift
//  PokerGameApp
//
//  Created by 한천희 on 2021/02/19.
//

import Foundation


class TrumpCard {
    enum Suit: Character, CaseIterable {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int, CaseIterable {
        case one, two = 2, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        struct Value {
            let firstDigit: Int?, secondCharacter: Character
        }
        
        var value: Value {
            switch self {
            case .one:
                return Value(firstDigit: nil, secondCharacter: "A")
            case .eleven:
                return Value(firstDigit: nil, secondCharacter: "J")
            case .twelve:
                return Value(firstDigit: nil, secondCharacter: "Q")
            case .thirteen:
                return Value(firstDigit: nil, secondCharacter: "K")
            default:
                return Value(firstDigit: self.rawValue, secondCharacter: "R")
            }
        }
    }
    
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
        
    var description: String {
        if let firstDigit = rank.value.firstDigit {
            return "\(suit.rawValue)\(firstDigit)"
        }
        return "\(suit.rawValue)\(rank.value.secondCharacter)"
    }
}


struct CardDeck {
        
    var cardDeck: Array<TrumpCard> = []
    
    func count() -> Int{
        return cardDeck.count
    }
    
    mutating func shuffle()-> [TrumpCard] {
        return cardDeck.shuffled()
    }
    
    mutating func removeOne() -> TrumpCard? {
        if let lastElement = cardDeck.last {
            cardDeck.removeLast()
            return lastElement
        }
        return nil
    }
    
    mutating func reset() {
        cardDeck = TrumpCard.Suit.allCases.flatMap { suit in
            TrumpCard.Rank.allCases.map { rank in
                TrumpCard(suit: suit, rank: rank)
            }
        }
   
    }
    
}

