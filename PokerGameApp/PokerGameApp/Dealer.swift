//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class Dealer: CardDeck {
    
    enum CardStud: Int {
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum ParticipantsNum: Int {
        case one = 1, two = 2, three = 3, four = 4
    }
    
    public var gameBoard = [[String]]()
    private var dealerCard = ["Dealer"]
    
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

extension Dealer.CardStud {
    var description: Int {
        return self.rawValue
    }
}

extension Dealer.ParticipantsNum {
    var description: Int {
        return self.rawValue
    }
}
