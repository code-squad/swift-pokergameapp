//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

enum GameType : Int {
    case seven = 7
    case five = 5
    
    var value : Int {
        return self.rawValue
    }
}

enum Participant : Int {
    case one = 1
    case two
    case three
    case four
    
    var value: Int {
        return self.rawValue
    }
}

enum GamerType {
    case participant
    case dealer
}

class PockerGame {
    private var players = Players()
    private let dealer = Dealer()
    private let participant : Int
    private let gameType : Int
    
    init(particpatin : Participant, gameType : GameType) {
        self.participant = particpatin.value
        self.gameType = gameType.value
    }
    
    func startGame() {
        players.addPlayer(particpatin: participant)
        
//        while true {
//            drawCard()
//            if cardDeck.empty() {
//                return
//            }
//            showPlayerCard()
//            resetPlayerCard()
//        }
    }
    
    
    private func drawCard() {
        
//        players.forEach { player in
//            (1...cardType).forEach { _ in
//                guard let card = cardDeck.removeOne() else { return }
//                player.receiveCard(card: card)
//            }
//        }
    }
    
    private func showPlayerCard() {
//        players.enumerated().forEach { player in
//            if !player.element.emptyCard() {
//                print(printResult(player: player.element, index: player.offset))
//            }
//        }
    }
    
//    private func printResult(player : Player, index : Int) -> String {
//        if player.type() == .participant {
//            return "참가자\(index+1)# \(player.showCards())"
//        } else {
//            return "딜러 \(player.showCards())"
//        }
//    }
    
    private func resetPlayerCard() {
//        players.forEach { player in
//            player.resetCard()
//        }
    }
}

