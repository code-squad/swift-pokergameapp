//
//  ScoreBoard.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

//class ScoreBoard{
//
//    private let participants : [String]
//    private var scoreBoard = [String: Int]()
//    init(with participants: [String]) {
//        self.participants = participants
//        doInitialSetUp()
//    }
//
//    func doInitialSetUp(){
//        for participantName in participants{
//            scoreBoard[participantName] = 0
//        }
//    }
//
//    func updateScores(of participantName: String, with pairs: [Combination]){
//        pairs.forEach{
//            pairType in
//            if let originalScore = scoreBoard[participantName]{
//                addScore(to: participantName, as: pairType.tellScore())
//            }
//        }
//    }
//
//    func tellHighestScore() -> String{
//        guard let winner = scoreBoard.max(by: { one, another in one.value < another.value})?.key else { return "" }
//        return winner
//    }
//
//    func addScore(to participant: String, as score: Int){
//        if let originalScore = scoreBoard[participant]{
//            scoreBoard[participant] = originalScore + score
//        }
//    }
//
//    // 동점일 경우 조합을 이룬 카드 중 Rank가 높은 카드를 갖고있는 참가자에게 추가점수 부여
//    func breakTie(between combinedCards: [String:[Int]]){  // combinedCards: 조합을 이룬 카드들을 모아둔 딕셔너리
//
//        if let highestScore = scoreBoard.max(by: { one, another in one.value < another.value}){
//            let tiebreakers = scoreBoard.filter{score in score == highestScore}
//            // 더 높은 랭크를 가진 사람에게 1점 더주기
//            compareHighestRank(between: tiebreakers, ranksOfCombinedCards: combinedCards)
//        }
//    }
//
//    // 받아온게 조합을 이룬 카드 배열
//    func compareHighestRank(between tiebreakers : [String:Int], ranksOfCombinedCards : [String:[Int]]){
//        var comparingCardRank = 0
//        for name in tiebreakers.keys{
//            guard let combindedCards = ranksOfCombinedCards[name]?.sorted(by: >) else { return }
//            let cardRank = combindedCards[0]
//
//            if comparingCardRank < cardRank {
//                addScore(to: name, as: 1)
//            }
//            comparingCardRank = cardRank
//
//        }
//    }
//}
