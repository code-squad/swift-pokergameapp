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
        dealer.deckCreateShuffle()
        do {
            try dealer.cardDistribution(currentGame: self)
        }
        catch{
            print("카드가 부족합니다.")
        }
        for i in 0..<player.count{
            player[i].printMycard(index: i + 1)
        }
        dealer.printMycard(index: 0) //사실 여긴 0이 필요없는데..? 상속 받은 함수를 새로 고쳐쓸 순 없나..
    }
}

enum errorOfGame : Error{
    case lackCard
}

class human {
    private var myCard : [Card]
    
    init(){
        self.myCard = []
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func printMycard(index : Int){
        print("player# \(index) \(myCard)")
    }
}

class Player : human{
    
}

class Dealer : human{
    private let deck : Deck
    
    init(dealerdeck : Deck){
        self.deck = dealerdeck
    }
    
    func isCardremain(currentGame: PokerGame) -> Bool{
        let DEALERCOUNT = 1
        if deck.getCount() >= (currentGame.getPlayers().count + DEALERCOUNT) * currentGame.getGameStyle(){
            return true
        }
        return false
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
    
    func deckCreateShuffle(){
        deck.resetDeck()
        do {try deck.shuffleDeck()}
        catch{
            print("카드가 부족합니다.")
        }
    }
}
