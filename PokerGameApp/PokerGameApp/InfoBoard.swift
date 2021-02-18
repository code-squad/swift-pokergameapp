//
//  InfoBoard.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/18.
//

import Foundation

class InfoBoard: CustomStringConvertible {
    
    var isGameFinished = false
    var cardCount: Int?
    var participantsList: [String]?
    var cardStackList: [[Card]]?
    
    var description: String {
        guard !isGameFinished else {
            return "덱에 카드가 모자라서 게임을 종료합니다.\n"
        }
        
        var gameStatus = ""
        
        if let pList = participantsList,
           let cList = cardStackList,
           pList.count == cList.count,
           let count = cardCount {
            
            for i in 0..<pList.count {
                gameStatus += "\(pList[i]): \(cList[i])\n"
            }
            
            gameStatus += "남은 카드는 \(count)장입니다.\n"
            
        } else {
            gameStatus = "게임 세팅이 잘못되었습니다!\n"
        }
        return gameStatus
    }
}
