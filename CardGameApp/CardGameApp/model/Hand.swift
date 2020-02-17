//
//  Hand.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/13.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Hand{
    enum resultPriority: Int{
        case noPair = 0, onePair, twoPair, fourCard, straight
    }
    
    private var card: [Card] = [Card]()
    private var result: resultPriority!
    
    func append(card: Card){
        self.card.append(card)
    }
    
    func removeAll(){
        self.card.removeAll()
    }
    
    func forEachCardInHand(_ transform: (Card) -> ()){
        card.forEach {
            transform($0)
        }
    }
}
