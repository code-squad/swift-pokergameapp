//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class PokerGame {
    
    var participants : InputView.PlayersCount
    var cardSqud : InputView.CardStud
    var players : Players
    var dealer : Dealer
    
    init(participants : InputView.PlayersCount, cardSqud : InputView.CardStud){

        self.cardSqud = cardSqud
        self.participants = participants
        
        self.players = Players(with: participants)
        self.dealer = Dealer(cardSqud: cardSqud)
    }
    
    private func gameReset(){
        players.removeAllCards()
        dealer.removeAllCards()
        dealer.resetCardDeck()
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
        print("참가자 수 : \(participants.rawValue)")
        print("카드 기준 : \(cardSqud.rawValue)")
    }
    
    private func printResult(){
        
        players.player.forEach{print("참가자# \($0.cards)")}
        print("딜러 \(dealer.cards)")
    }
}
