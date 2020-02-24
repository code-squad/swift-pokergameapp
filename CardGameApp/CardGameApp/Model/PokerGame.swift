//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

enum NumbersOfPlayers : Int {
    case one = 1 , two, three, four
    
    func setPlayerSeat(for behavior: () -> ()) {
        for _ in 1 ... self.rawValue {
            behavior()
        }
    }
}

enum GameMode : Int {
    case fiveCardStud = 5
    case sevenCardStud = 7
    
    func compareStudNumber(with target : Int) -> Bool {
        return self.rawValue == target
    }
    
    func setCardPlacement(of behavior: ()-> ()) {
        for _ in 1 ... self.rawValue{
            behavior()
        }
    }
}

class PokerGame {
    
    private let gameMode: GameMode
    private let dealer = Dealer()
    private let numbersOfPlayers : NumbersOfPlayers
    private var players = Players(with: nil)
    
    init(numbersOfPlayers: NumbersOfPlayers, gameMode: GameMode) {
        self.gameMode = gameMode
        self.numbersOfPlayers = numbersOfPlayers
        self.players = Players(with: numbersOfPlayers)
    }
    
    func start() {
//        gameMode.setCardPlacement {
            distributeCards()
//            }
    }
    
    private func distributeCards() {
        // players
        
        gameMode.setCardPlacement {
        var newCard = dealer.giveOneCard()
         players.addCard(newCard: newCard)
       }
        var newCard = dealer.giveOneCard()
        dealer.addCard(newCard: newCard)
    }
    
    func shuffleWholeCardDeck(){
        dealer.shuffleCardDeck()
    }
    
    func forEachPlayer(behavior: (Player) -> ()) {
        players.showParticipantsCards(behavior: ) { (player) in
            behavior(player)
        }
    }
    
}
