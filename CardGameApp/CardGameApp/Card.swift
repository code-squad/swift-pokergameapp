//
//  Card.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/10.
//  Copyright © 2020 Viet. All rights reserved.
//

class Card: CustomStringConvertible {
    // 카드는 하나의 suit만 갖기 때문에 enum으로 구현. 또 출력용 값을 따로 처리할 수 있음
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case spade = "♠️"
        case diamond = "♦️️️"
        case heart = "♥️"
        case club = "♣️"
        
        var description: String {
            self.rawValue
        }
    }
    
    // 카드는 하나의 rank만 갖기 때문에 enum으로 구현. 또 출력용 값을 따로 처리할 수 있음
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return String(rawValue)
            }
        }
    }
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.rank = rank
        self.suit = suit
    }
    
    var description: String {
        "\(suit)\(rank)"
    }
}

