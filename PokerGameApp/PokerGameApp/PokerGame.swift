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

class PockerGame {
    private var cardDeck = CardDeck()
    private var players : [Player] = []
    private let dealer = Dealer()
    
    init(participant: Participant) {
        cardDeck.shuffle()
        createPlayer(people : participant.rawValue)
    }
    
    func startGame(cardType : GameType) {
        while true {
            drawCard(cardType: cardType.rawValue)
            showPlayerCard()
            resetPlayerCard()
            if cardDeck.count() == 0 {
                return
            }
        }
    }
    
    func createPlayer(people : Int) {
        (1...people).forEach { _ in
            players.append(Player())
        }
        players.append(dealer)
    }
    
    func drawCard(cardType : Int) {
        players.forEach { player in
            (1...cardType).forEach { _ in
                guard let card = cardDeck.removeOne() else { return }
                player.receiveCard(card: card)
            }
        }
    }
    
    func showPlayerCard() {
        players.forEach { player in
            if player.countCard() > 0 {
                print(player.showCards())
            }
        }
    }
    
    func resetPlayerCard() {
        players.forEach { player in
            player.resetCard()
        }
    }
}

