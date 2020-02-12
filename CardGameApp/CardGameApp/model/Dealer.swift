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
    private var _ownCardDeck:[Card]
    
    init(){
        self.cardDeck = CardDeck()
        self.cardDeck.shuffle()
        self._ownCardDeck = [Card]()
    }
    
    func deal() -> Card?{
        return self.cardDeck.removeOne()
    }
}

extension Dealer:CustomStringConvertible{
    var description: String {
        return "\(self._ownCardDeck)"
    }
}

extension Dealer:MustHaveCard{
    var ownCardDeck: [Card] {
        return self._ownCardDeck
    }
    
    func receiveCard(card: Card) {
        self._ownCardDeck.append(card)
    }
}
