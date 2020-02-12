//
//  Player.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Player{
    private var _ownCardDeck:[Card]
    
    init(){
        self._ownCardDeck = [Card]()
    }
}

extension Player:CustomStringConvertible{
    var description: String {
        return "\(self._ownCardDeck)"
    }
}

extension Player:MustHaveCard{
    var ownCardDeck: [Card] {
        return self._ownCardDeck
    }
    
    func receiveCard(card : Card){
        self._ownCardDeck.append(card)
    }
}

