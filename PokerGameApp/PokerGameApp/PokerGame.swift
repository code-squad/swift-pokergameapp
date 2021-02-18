//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/18.
//

import Foundation

class PokerGame{
    private var gameStyle : Int
    private let dealer : Dealer
    private var player : [Player]
    private let deck : Deck
    
    init(GameStyle : Int) {
        self.gameStyle = GameStyle
        self.dealer = Dealer()
        player = []
        deck = Deck()
    }
    
    func decidePlayerNum(_ playerCount : Int) -> Void   {
        for _ in 0..<playerCount{
            let newplayer = Player()
            player.append(newplayer)
        }
    }
    
    func gameStart(){
        decidePlayerNum(3)
    }
    
    func cardDistribution() throws -> Void{
        guard isCardremain() else{
            throw errorOfGame.lackCard
        }
        for _ in 0..<gameStyle{
            for i in 0..<player.count{
                player[i].addCard(deck.takeOnecard())
            }
            dealer.addCard(deck.takeOnecard())
        }
    }
    
    func isCardremain() -> Bool{
        let DEALERCOUNT = 1
        if deck.getCount() >= (player.count + DEALERCOUNT) * gameStyle{
            return true
        }
        return false
    }
}

enum errorOfGame : Error{
    case lackCard
}

class Player{
    private var myCard : [Card] = []
    
    func addCard(_ card : Card) -> Void{
        myCard.append(card)
    }
}

class Dealer{
    private var myCard : [Card] = []
    
    func addCard(_ card : Card) -> Void{
        myCard.append(card)
    }
}
