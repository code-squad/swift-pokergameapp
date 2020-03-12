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
    private var scoreBoard = [PokerPlayer:Int]()
    private var winner = PokerPlayer()
    private var winnerPosition : Int
    
    init(numbersOfPlayers: NumbersOfPlayers, gameMode: GameMode) {
        self.gameMode = gameMode
        self.numbersOfPlayers = numbersOfPlayers
        self.allParticipants = Participants(with: numbersOfPlayers, and: dealer)
        self.winnerPosition = allParticipants.findPosition(of: winner)
        // 참가자 수만큼 ScoreBoard key에 참가자 이름을 넣고 기본 점수 0을 value로 설정
        allParticipants.forEachParticipant(behavior: ){ participant in
            scoreBoard[participant] = 0
        }
    }
    
    func start() {
        shuffleWholeCardDeck()
        gameMode.setCardPlacement {
        destributeCards()
        }
    }
    
    func destributeCards() {
        allParticipants.forEachParticipant(behavior: ) { participant in
            participant.addOneCard(newCard: dealer.giveOneCard())
        }
    }
    
    func shuffleWholeCardDeck(){
        dealer.shuffleCardDeck()
    }
    
    func forEachParticipant(behavior: (PokerPlayer) -> ()) {
        allParticipants.forEachParticipant(behavior: ) { participant in
            behavior(participant)
        }
    }

    func findWinner() -> Int {
        allParticipants.findCombination()
        allParticipants.updateEachScore(){ pokerplayer,score in
            addScore(to: pokerplayer, extraScore: score)
        }
        breakTie()
        let winner = scoreBoard.max(by:){ participant, anotherParticipant in participant.value < anotherParticipant.value}?.key
        guard let theWinner = winner else { return -1 }
        self.winner = theWinner
        winnerPosition = allParticipants.findPosition(of: theWinner)
        return winnerPosition
    }
    
    func addScore(to participant: PokerPlayer,extraScore: Int){
        guard let originalScore = scoreBoard[participant] else { return }
          scoreBoard[participant] = originalScore + extraScore
    }
    
    func breakTie(){
            guard let highestScore = scoreBoard.max(by: { participant, anotherParticipant in participant.value < anotherParticipant.value}) else { return }
            
            let tiebreakers = scoreBoard.filter{score in score == highestScore}
        
        allParticipants.giveExtraScoreForHigherRank(addScore: ){ pokerPlayer, score in
            addScore(to: pokerPlayer, extraScore: 1)
        }
    }
}
