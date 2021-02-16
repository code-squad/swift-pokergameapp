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
}

enum Participant : Int {
    case one = 1
    case two
    case three
    case four
}

enum GamerType {
    case participant
    case dealer
}

class PockerGame {
    private var cardDeck = CardDeck()
    private var players : [Player] = []
    private let dealer = Dealer(type: .dealer)
    
    init(participant: Participant) {
        cardDeck.shuffle()
        createPlayer(people : participant.rawValue)
    }
    
    func startGame(cardType : GameType) {
        while true {
            drawCard(cardType: cardType.rawValue)
            if cardDeck.empty() {
                return
            }
            showPlayerCard()
            resetPlayerCard()
        }
    }
    
    private func createPlayer(people : Int) {
        (1...people).forEach { _ in
            players.append(Player(type: .participant))
        }
        players.append(dealer)
    }
    
    private func drawCard(cardType : Int) {
        players.forEach { player in
            (1...cardType).forEach { _ in
                guard let card = cardDeck.removeOne() else { return }
                player.receiveCard(card: card)
            }
        }
    }
    
    private func showPlayerCard() {
        players.enumerated().forEach { player in
            if !player.element.emptyCard() {
                print(printResult(player: player.element, index: player.offset))
            }
        }
    }
    
    private func printResult(player : Player, index : Int) -> String {
        if player.type() == .participant {
            return "참가자\(index+1)# \(player.showCards())"
        } else {
            return "딜러 \(player.showCards())"
        }
    }
    
    private func resetPlayerCard() {
        players.forEach { player in
            player.resetCard()
        }
    }
}

