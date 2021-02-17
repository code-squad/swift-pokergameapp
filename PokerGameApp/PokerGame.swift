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
        static let cardstud = 7
    }
    
    var gameCardDeck : PlayingCardDeck
    var players : Players
    var dealer : Dealer
    
    init(){
        self.gameCardDeck = PlayingCardDeck()
        self.players = Players(totalPlayers: Constant.numberOfPlayers)
        self.dealer = Dealer()
    }
    
    private func gameReset(){
        gameCardDeck.initialize()
        gameCardDeck.shuffle()
        players.player.forEach{$0.cards.removeAll()}
        dealer.cards.removeAll()
    }

    public func start(){
        gameReset()
        printRule()
        
        players.player.forEach{spreadCardsToPerson(person:$0)}
        spreadCardsToPerson(person: dealer)
        
        printResult()
    }

    private func spreadCardsToPerson(person : Dealer){
        let cards = gameCardDeck.removeCards(count: Constant.cardstud)
        person.cards.takeCards(cards: cards)
    }
    
    private func printRule(){
        print("참가자 수 : \(Constant.numberOfPlayers)")
        print("\(Constant.cardstud)카드 기준")
    }
    
    private func printResult(){
        
        players.player.forEach{print("참가자#\($0.id) \($0.cards)")}
        print("딜러 \(dealer.cards)")
        print("남아있는 카드의 수 \(gameCardDeck.count)")
    }
}
