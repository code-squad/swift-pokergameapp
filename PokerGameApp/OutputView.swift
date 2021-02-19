//
//  OutputView.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/19.
//

import Foundation

struct OutputView {
    
    static func cardToString(card : Card) -> String {
        var cardname : String = ""
        
        switch card.suit {
        case .clubs : cardname += "c"
        case .dimonds : cardname += "d"
        case .hearts : cardname += "h"
        case .spades : cardname += "s"
        }
        cardname += card.rank.description
        return cardname
    }
}
