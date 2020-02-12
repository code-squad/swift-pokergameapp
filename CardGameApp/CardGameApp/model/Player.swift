//
//  Player.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Player{
    private var ownCardDeck:[Card]
    
    init(){
        self.ownCardDeck=[Card]()
    }
    
    func receiveCard(card : Card){
        self.ownCardDeck.append(card)
    }
}

extension Player:CustomStringConvertible{
    var description: String {
        return "\(self.ownCardDeck)"
    }
}


#if DEBUG
extension Player{
    public func getCardCount() -> Int{
        return self.ownCardDeck.count
    }
}
#endif

