//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/18.
//

import Foundation

class PokerGame{
    
    private var gameStyle : Int
    private var deck : Deck
    private let dealer : Dealer
    private var player : [Player]
    
    init(GameStyle : Int) {
        self.gameStyle = GameStyle
        self.deck = Deck()
        self.player = []
        self.dealer = Dealer(dealerdeck: self.deck)
    }
    
    func decidePlayerNum(_ playerCount : Int) -> Void   {
        for _ in 0..<playerCount{
            let newplayer = Player()
            player.append(newplayer)
        }
    }
    
    func getGameStyle() -> Int{
        return gameStyle
    }
    
    func getPlayers() -> [Player]{
        return player
    }
    
    func getDealer() -> Dealer{
        return dealer
    }
    
    func gameStart(){
        decidePlayerNum(3)
    }
}

enum errorOfGame : Error{
    case lackCard
}

class Player{
    private var myCard : [Card] = []
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func printMycard(){
        print(myCard)
    }
}

class Dealer{
    
    private var myCard : [Card]
    private let deck : Deck
    
    init(dealerdeck : Deck){
        self.myCard = []
        self.deck = dealerdeck
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func cardDistribution(currentGame: PokerGame) throws -> Void{
        guard isCardremain(currentGame: currentGame) else{
            throw errorOfGame.lackCard
        }
        for _ in 0..<currentGame.getGameStyle(){
            for i in 0..<currentGame.getPlayers().count{
                currentGame.getPlayers()[i].receiveCard(deck.takeTopcard())
                deck.removeTopCard()
            }
            currentGame.getDealer().receiveCard(deck.takeTopcard())
            deck.removeTopCard()
        }
    }
    
    func isCardremain(currentGame: PokerGame) -> Bool{
        let DEALERCOUNT = 1
        if deck.getCount() >= (currentGame.getPlayers().count + DEALERCOUNT) * currentGame.getGameStyle(){
            return true
        }
        return false
    }
}
