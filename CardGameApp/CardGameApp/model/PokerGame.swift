//
//  pokerGame.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class PokerGame{
    private var dealer:Dealer = Dealer()
    private var players:[Player] = [Player]()
    private var stud:Stud
    private var numOfPlayer:NumOfPlayer
    
    enum Stud:Int{
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        func forEach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    enum NumOfPlayer:Int{
        case one = 1, two, three, four
        
        func forEach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    init(){
        self.stud = Stud.sevenCardStud
        self.numOfPlayer = NumOfPlayer.four
        readyPlayer()
    }
    
    private func readyPlayer(){
        self.dealer = Dealer()
        self.players = [Player]()
        self.numOfPlayer.forEach {
            players.append(Player())
        }
    }
    
    func gameStart(){
        self.stud.forEach {
            for player in players{
                dealCardToPlayer(player: player)
            }
            dealCardToPlayer(player: dealer)
        }
    }
    
    private func dealCardToPlayer(player:MustHaveCard){
        let myCard = dealer.deal()
        if let card = myCard{
            player.receiveCard(card: card)
        } else {
            print("카드가 없습니다.")
        }
    }
    
    func setGameStyle(stud:Stud, numOfPlayer:NumOfPlayer){
        self.stud = stud
        self.numOfPlayer = numOfPlayer
        readyPlayer()
        gameStart()
    }
}

extension PokerGame:CustomStringConvertible{
    var description: String {
        var result = ""
        var count = 1
        for player in players{
            result += "참가자#\(count) \(player)\n"
            count += 1
        }
        result += "딜러 \(dealer)\n"
        return result
    }
}
