//
//  Player.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Player{
    private var hand:Hand = Hand()
    
    func receiveCard(card: Card) {
        hand.append(card: card)
    }
    
    func removeAll(){
        hand.removeAll()
    }
    
    func forEach(_ transform : (Card) -> ()){
        hand.forEach{
            transform($0)
        }
    }
}

