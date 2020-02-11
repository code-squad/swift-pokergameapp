//
//  Dealer.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Dealer{
    private var cardDeck:CardDeck
    private var ownCardDeck:[Card]
    
    init(){
        self.cardDeck=CardDeck()
        self.cardDeck.shuffle()
        self.ownCardDeck=[Card]()
    }
    
    func deal() -> Card?{
        return self.cardDeck.removeOne()
    }
}
