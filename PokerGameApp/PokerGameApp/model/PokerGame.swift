//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

public class PokerGame {
    
    enum GameStyle : Int{
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
    private var currentGameStyle : GameStyle
    private let dealer : Dealer
    private let players : Players
    
    init(howManyHands gameStyle : GameStyle, howManyPlayer playerCount : Int) {
        self.currentGameStyle = gameStyle
        self.dealer = Dealer()
        self.players = Players.init(howManyPlayer: playerCount)
    }
    
    func test() {
        dealer.printDeck()
        let firstPlayer = players.selectPlayer(who: 0)
        dealer.sendCard(to: firstPlayer)
        dealer.sendCard(to: dealer)
        print("firstPlayer's hand : \(firstPlayer.showHand())")
        print("dealer's hand : \(dealer.showHand())")
        dealer.printDeck()
        
        
    }
}
