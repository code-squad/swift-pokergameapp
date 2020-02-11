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
    
    func gameStart(){
        for _ in 0..<stud.rawValue{
            for player in players{
                dealCardToPlayer(player: player)
            }
            dealCardToPlayer(player: dealer)
        }
    }
    
    private func dealCardToPlayer(player:Player){
        let myCard=dealer.deal()
        if let card = myCard{
            player.receiveCard(card: card)
        } else {
            exit(0)
        }
    }
}

extension PokerGame:CustomStringConvertible{
    var description: String {
        var result=""
        var count=1
        for player in players{
            result+="참가자#\(count) \(player)\n"
            count+=1
        }
        result+="딜러 \(dealer)\n"
        return result
    }
}
