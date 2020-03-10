//
//  WinnerDiscriminator.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class WinnerDiscriminator{
    private let pokerGame : PokerGame
    var participantsCardsDictionary : [String: [Int]] = [:]
    var participantsCombinedCardsDictionary : [String: [Int]] = [:]
    var allParticipants = [String]()
    var scoreBoard = ScoreBoard(with: [])
    
    
    init(in pokerGame : PokerGame) {
        self.pokerGame = pokerGame
        self.allParticipants = listUpParticipants()
        self.scoreBoard = ScoreBoard(with: allParticipants)
        addParticipnatCardsToDictionary()
    }
    
    func makeScoreBoard() -> ScoreBoard{
        return ScoreBoard(with: allParticipants)
    }
    
    func listUpParticipants() -> [String]{
        var participantsList = [String]()
        var playerNumber = 1
        pokerGame.forEachParticipant(behavior: ){ player in
            participantsList.append("Player\(playerNumber)")
            playerNumber += 1
        }
        participantsList.append("Dealer")
        return participantsList
    }
    
    func addParticipnatCardsToDictionary(){
        var onePlayerCards = [Int]()
        var participantIndex = 0
        pokerGame.forEachParticipant(behavior: ){ player in
            player.showEachCardInHand(behavior: ){ card in
                onePlayerCards.append(card.cardNumber)
            }
            participantsCardsDictionary[allParticipants[participantIndex]] = onePlayerCards
            participantIndex += 1
        }
    }

    func findWinner() -> String{
        findCombination(then: ){ oneParticipant, combinations in
            scoreBoard.updateScores(of: oneParticipant, with: [combinations])
        }
        // 동점자 체크 후 Rank가 더 높은 참가자에게 추가점수 주기
        scoreBoard.breakTie(between: participantsCombinedCardsDictionary)
        // 승자 찾기
        let winner = scoreBoard.tellHighestScore()
        return winner
    }
    
    func findCombination(then behavior: (String,Combination)->()){
        
        // 딕셔너리에 있는 원래 카드 숫자 배열 -> 조합을 이룬 카드 숫자 배열로 바꾸기
        for oneParticipant in allParticipants{
            
            guard var cardsToCheck = participantsCardsDictionary[oneParticipant] else { return }
            
            cardsToCheck.remove(at: 0)
            
            // 여기서 어떤 조합이 있는지 체크
            let handCombination = HandCombination()
            var combinations = handCombination.checkStraight(of: cardsToCheck)
            combinations = handCombination.checkPair(of: cardsToCheck)
            
            // 각 참가자가 조합을 이룬 카드들을 딕셔너리에 저장하기
            var combinedCards = handCombination.submitCombinedCards()
            participantsCombinedCardsDictionary[oneParticipant] = combinedCards
        }
    }
}
