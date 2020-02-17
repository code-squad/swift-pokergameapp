//
//  Dealer.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Dealer: Player{
    private var cardDeck: CardDeck
    
    init(){
        self.cardDeck = CardDeck()
        self.cardDeck.shuffle()
        super.init(order: 0)
    }
    
    func deal() -> Card?{
        return self.cardDeck.removeOne()
    }
}

