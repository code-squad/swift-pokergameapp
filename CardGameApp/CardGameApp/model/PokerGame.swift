//
//  pokerGame.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class PokerGame{
    private var dealer:Dealer
    enum Stud:Int{
        case fiveCardStud=5
        case sevenCardStud=7
    }
    
    enum NumOfPlayer:Int{
        case one=1,two,three,four
    }
    
    init(){
        self.dealer=Dealer()
    }
}
