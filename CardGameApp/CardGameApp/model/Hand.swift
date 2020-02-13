//
//  Hand.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/13.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Hand{
    private var card:[Card] = [Card]()
    
    func append(card : Card){
        self.card.append(card)
    }
    
    func removeAll(){
        self.card.removeAll()
    }
    
    func forEach(_ transform : (Card) -> ()){
        card.forEach {
            transform($0)
        }
    }
}
