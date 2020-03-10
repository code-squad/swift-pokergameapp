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
    private var scoreBoard = [String:Int]()
    
    init(numbersOfPlayers: NumbersOfPlayers, gameMode: GameMode) {
        self.gameMode = gameMode
        self.numbersOfPlayers = numbersOfPlayers
        self.allParticipants = Participants(with: numbersOfPlayers, and: dealer)
        // 참가자 수만큼 ScoreBoard key에 참가자 이름을 넣고 기본 점수 0을 value로 설정
        allParticipants.forEachParticipant(behavior: ){participant in
            scoreBoard[participant.describeSelf()] = 0
        }
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
        allParticipants.forEachParticipant(behavior: ) { (participant) in
            behavior(participant)
        }
    }
    
    func findWinner() -> String{
        allParticipants.findCombination()
        updateEachScore()
        breakTie()
        let winner = scoreBoard.max(by:){ participant, anotherParticipant in participant.value < anotherParticipant.value}?.key
        guard let theWinner = winner else { return ""}
        return theWinner
    }
    
    func updateEachScore(){
        allParticipants.forEachParticipant(behavior: ){ participant in
            participant.showEachMyCombination(behavior: ){ combination in
                let name = participant.describeSelf()
                let score = combination.tellScore()
                addScore(to: name, extraScore: score)
            }
        }
    }
    
    func addScore(to participant: String,extraScore: Int){
        guard let originalScore = scoreBoard[participant] else { return }
          scoreBoard[participant] = originalScore + extraScore
    }
    
    func breakTie(){
            guard let highestScore = scoreBoard.max(by: { participant, anotherParticipant in participant.value < anotherParticipant.value}) else { return }
            
            let tiebreakers = scoreBoard.filter{score in score == highestScore}
        
            allParticipants.forEachParticipant(behavior: ){ participant in
                
                giveExtraScoreForHigherRank(to: participant)
            }
    }
    
    func giveExtraScoreForHigherRank(to participant: PokerPlayer){
        var comparingRank = 0
        participant.showHighestRank(behavior: ){
            cardRank in
            
            if comparingRank <= cardRank {
                comparingRank = cardRank
            }else{
                // 더 높은 사람에게 추가점수
                let name = participant.describeSelf()
                addScore(to: name, extraScore: 1)
            }
        }
    }
}
