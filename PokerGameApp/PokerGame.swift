//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/16.
//

import Foundation

class PokerGame {
    
    enum Constant {
        static let numberOfPlayers = 3
        static let cardstud = 5
    }
    
    var gameCardDeck = PlayingCardDeck()

    public func start(){
        gameCardDeck.reset()
        gameCardDeck.shuffle()
        printRule()
        
        var players = Players(totalPlayers: Constant.numberOfPlayers)
        var dealer = Dealer()
        
        spreadCardsToPlayers(players: &players, dealer: &dealer)
        printResult(players: &players, dealer: &dealer)
    }

    private func spreadCardsToPlayers(players : inout Players, dealer : inout Dealer){
    
        for player in players.player {
            let cards = gameCardDeck.removeCards(count: Constant.cardstud)
            player.cards.takeCards(cards: cards)
        }
        let cards = gameCardDeck.removeCards(count: Constant.cardstud)
        dealer.cards.takeCards(cards: cards)
    }
    
    private func printRule(){
        print("참가자 수 : \(Constant.numberOfPlayers)")
        print("\(Constant.cardstud)카드 기준")
    }
    
    private func printResult(players : inout Players, dealer : inout Dealer){
        players.player.map{print("참가자#\($0.id) \($0.cards)")}
        print("딜러 \(dealer.cards)")
        
        print("남아있는 카드의 수 \(gameCardDeck.count)")
    }
}
