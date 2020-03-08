//
//  ScoreBoard.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class ScoreBoard{
    
    let participants : [String]
    var scoreBoard = [String: Int]()
    init(with participants: [String]) {
        self.participants = participants
        doInitialSetUp()
    }
    
    func doInitialSetUp(){
        for participantName in participants{
            scoreBoard[participantName] = 0
        }
    }
    
    func updateScores(of participantName: String, with pairs: [Combination]){
        pairs.forEach{
            pairType in
            if let originalScore = scoreBoard[participantName]{
                addScore(to: participantName, as: pairType.tellScore())
            }
        }
    }
    
    func tellHighestScore() -> String{
        guard let winner = scoreBoard.max(by: { one, another in one.value < another.value})?.key else { return "" }
        return winner
    }
    
    func addScore(to participant: String, as score: Int){
        if let originalScore = scoreBoard[participant]{
            scoreBoard[participant] = originalScore + score
        }
    }
}
