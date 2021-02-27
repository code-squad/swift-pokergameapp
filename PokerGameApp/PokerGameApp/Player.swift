//
//  Player.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Player {
    private var myCard : [Card]
    
    init(){
        self.myCard = []
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func showMyHands(){
        print(myCard)
    }
}
