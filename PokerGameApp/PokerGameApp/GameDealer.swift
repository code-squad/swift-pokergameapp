//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

class CardGame: CardPlaying {

    var participantsNum = 3
    var cardStud = 5
    var gameBoard = [[String]]()
    var dealerCard = ["Dealer"]

    func startGame(participantsNum: Int) {

        gameBoard.append(dealerCard)

        for i in 1...participantsNum {
            
            gameBoard.append(["Participant \(i)"])
            
        }

    }

    func distributeCard(cardStud: Int) {

        shuffleDeck()
        
        if deck.count >= cardStud * participantsNum {
            
            for i in 0..<gameBoard.count {

                for _ in 1...cardStud {

                    gameBoard[i].append(deck[0])
                    removeOne()

                }

            }
            
        } else if deck.count < cardStud * participantsNum {
            
            print("quit")
            resetDeck()
            
        }

        

    }

}

