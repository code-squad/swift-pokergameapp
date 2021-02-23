//
//  CardImage.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

struct CardImage {
    private let card: Card
    private var suitInitial: String
    let fileName: String
    
    init(of card: Card) {
        self.card = card
        switch card.suit {
        case .spades:
            suitInitial = "s"
        case .hearts:
            suitInitial = "h"
        case .diamonds:
            suitInitial = "d"
        case .clubs:
            suitInitial = "c"
        }
        self.fileName = "\(suitInitial)\(card.rank)"
    }
}
