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
    private var players:[Player]
    private var stud:Stud
    private var numOfPlayer:NumOfPlayer
    
    enum Stud:Int{
        case fiveCardStud=5
        case sevenCardStud=7
    }
    
    enum NumOfPlayer:Int{
        case one=1,two,three,four
    }
    
    init(){
        self.stud=Stud.sevenCardStud
        self.numOfPlayer=NumOfPlayer.four
        self.dealer=Dealer(stud: stud.rawValue, numOfPlayer: numOfPlayer.rawValue)
        self.players=[Player]()
        for _ in 0..<self.numOfPlayer.rawValue{
            players.append(Player())
        }
    }
}
