//
//  pokerGame.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class PokerGame{
    private var dealer: Dealer = Dealer()
    private var players: Players = Players()
    private var stud: Stud = .sevenCardStud
    private var numOfPlayer: NumOfPlayer = .four
    
    enum Stud: Int, CaseIterable{
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        init(index: Int){
            self = Stud.allCases[index]
        }
        
        func forEach(_ transform: () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    enum NumOfPlayer: Int, CaseIterable{
        case one = 1, two, three, four
        
        init(index: Int){
            self = NumOfPlayer.allCases[index]
        }
        
        func forEach(_ transform: () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    init(){
        gameStart()
    }
    
    private func readyPlayer(){
        var count = 1
        self.dealer = Dealer()
        self.players = Players()
        self.numOfPlayer.forEach {
            players.append(Player(order: count))
            count += 1
        }
    }
    
    func gameStart(){
        readyPlayer()
        stud.forEach {
            players.forEachPlayer{
                dealCard(to: $0)
            }
            dealCard(to: dealer)
        }
        players.append(dealer)
        
        players.forEachPlayer{
            $0.sortCards()
        }
    }
    
    func winner() -> String{
        let highest = players.findHighest()
        
        return "\(highest)"
    }
    
    private func dealCard(to player: Player){
        let myCard = dealer.deal()
        player.receiveCard(card: myCard!)
    }
    
    func setGameStyle(stud:Stud, numOfPlayer: NumOfPlayer){
        self.stud = stud
        self.numOfPlayer = numOfPlayer
    }
    
    func forEachPlayers(_ transform: (Player) -> ()){
        players.forEachPlayer{
            transform($0)
        }
    }
}
