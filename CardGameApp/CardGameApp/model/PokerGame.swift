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
    
    enum Stud: Int{
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        func forEach(_ transform: () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    enum NumOfPlayer: Int{
        case one = 1, two, three, four
        
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
        self.dealer = Dealer()
        self.players = Players()
        self.numOfPlayer.forEach {
            players.append(Player())
        }
    }
    
    func gameStart(){
        readyPlayer()
        stud.forEach {
            players.forEach{
                dealCardToPlayer(player: $0)
            }
            dealCardToPlayer(player: dealer)
        }
        players.append(dealer)
    }
    
    private func dealCardToPlayer(player: Player){
        let myCard = dealer.deal()
        if let card = myCard{
            player.receiveCard(card: card)
        } else {
            print("카드가 없습니다.")
        }
    }
    
    func setGameStyle(stud:Stud, numOfPlayer: NumOfPlayer){
        self.stud = stud
        self.numOfPlayer = numOfPlayer
        gameStart()
    }
    
    func forEachPlayers(_ transform: (Player) -> ()){
        players.forEach{
            transform($0)
        }
    }
}
