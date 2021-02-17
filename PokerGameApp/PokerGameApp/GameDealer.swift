//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class Dealer: DeckHandling {
    
    enum CardStud: Int {
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum ParticipantsNum: Int {
        case one = 1, two = 2, three = 3, four = 4
    }
    
    public var gameBoard = [[String]]()
    private var dealerCard = ["Dealer"]
    
    // 먼저 값을 설정해놓고 5단계 구현에서 버튼 입력 시 값이 변경될 수 있도록 구현하려고 합니다.
    // 이 클래스 내에서 값을 변경할 수 있는 코드를 작성해야 하는지, 그렇다면 카드스터드와 참가자 수를 결정하는
    // 함수를 작성해야 하는건지 헤매고 있습니다.
    public var cardStud = 5
    public var participantsNum = 1
    
    public func startGame() {
        make()
        gameBoard.append(dealerCard)
        for i in 1...participantsNum {
            gameBoard.append(["Participant \(i)"])
        }
    }
    
    public func distributeCard() {
        deck.shuffle()
        if deck.count >= cardStud * participantsNum {
            for i in 0..<gameBoard.count {
                for _ in 1...cardStud {
                    gameBoard[i].append(deck[0])
                    removeOne()
                }
            }
        } else if deck.count < cardStud * participantsNum {
            print("quit")
            reset()
        }

    }

}

