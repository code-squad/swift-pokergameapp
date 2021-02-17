//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class PokerGame {
    
    var countOfPlayer = InputView.PlayersCount.three
    var players : Players
    var dealer : Dealer
    
    init(){
        self.players = Players(total: countOfPlayer)
        self.dealer = Dealer()
    }
    
    private func gameReset(){
        players.removeAllCards()
        dealer.removeAllCards()
    }

    public func start(){
        gameReset()
        printRule()
        
        dealer.shuffleCards()
        dealer.spreadCardsToPlayer(players : players)
        dealer.spreadCardsToDealer()
        
        printResult()
    }

    private func printRule(){
        print("참가자 수 : \(countOfPlayer.rawValue)")
        print("카드 기준 : \(dealer.cardSqud.rawValue)")
    }
    
    private func printResult(){
        
        players.player.forEach{print("참가자# \($0.cards)")}
        print("딜러 \(dealer.cards)")
    }
}
