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
    private var allParticipants : Participants
    
    init(numbersOfPlayers: NumbersOfPlayers, gameMode: GameMode) {
        self.gameMode = gameMode
        self.numbersOfPlayers = numbersOfPlayers
        self.allParticipants = Participants(with: numbersOfPlayers, and: dealer)
    }
    
    func start() {
        shuffleWholeCardDeck()
        gameMode.setCardPlacement {
            destributeCards()
        }
    }
    
    func destributeCards() {
        self.forEachParticipant(behavior: ){ participant in
            participant.addOneCard(newCard: dealer.giveOneCard())
        }
    }
    
    func shuffleWholeCardDeck(){
        dealer.shuffleCardDeck()
    }
    
    func forEachParticipant(behavior: (PokerPlayer) -> ()) {
        allParticipants.showParticipantsCards(behavior: ) { (participant) in
            behavior(participant)
        }
    }
}
