//
//  Player.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Player{
    private var hand: Hand = Hand()
    private var order: Int
    
    init(order: Int){
        self.order = order
    }
    
    func receiveCard(card: Card) {
        hand.append(card: card)
    }
    
    func removeAll(){
        hand.removeAll()
    }
    
    func forEachHandPlayerHas(_ transform: (Card) -> ()){
        hand.forEachCardInHand{
            transform($0)
        }
    }
}

extension Player: CustomStringConvertible{
    var description: String {
        guard self is Dealer else{
            return "Player\(order)"
        }
        return "Dealer"
    }
}
