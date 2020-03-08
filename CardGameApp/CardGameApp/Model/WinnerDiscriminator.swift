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
    private let utility = Utility()
    var participantsCardsDictionary : [String: [Int]] = [:]
    var participantsCombinedCardsDictionary : [String: [Int]] = [:]
    var allParticipants = [String]()
    var scoreBoard = ScoreBoard(with: [])
    
    
    init(in pokerGame : PokerGame) {
        self.pokerGame = pokerGame
        self.allParticipants = listUpParticipants()
        self.scoreBoard = ScoreBoard(with: allParticipants)
        addPlayersCardsToDictionary()
        addDealerCardsToDictionary()
    }
    
    func makeScoreBoard() -> ScoreBoard{
        return ScoreBoard(with: allParticipants)
    }
    
    func listUpParticipants() -> [String]{
        var participantsList = [String]()
        var playerNumber = 1
        pokerGame.forEachPlayer(behavior: ){ player in
            participantsList.append("Player\(playerNumber)")
            playerNumber += 1
        }
        participantsList.append("Dealer")
        return participantsList
    }
    
    func addPlayersCardsToDictionary(){
        var onePlayerCards = [Int]()
        var participantIndex = 0
        pokerGame.forEachPlayer(behavior: ){ player in
            player.showEachCardInHand(behavior: ){ card in
                onePlayerCards.append(utility.convertToNumber(text: card.numberDescription))
            }
            participantsCardsDictionary[allParticipants[participantIndex]] = onePlayerCards
            participantIndex += 1
        }
    }
    
    func addDealerCardsToDictionary(){
        var dealerCards = [Int]()
        pokerGame.showDealerCards(behavior: ){ card in
            dealerCards.append(utility.convertToNumber(text: card.numberDescription))
        }
        participantsCardsDictionary["Dealer"] = dealerCards
    }
}
