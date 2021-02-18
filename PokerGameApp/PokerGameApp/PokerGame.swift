//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/17.
//

import Foundation

class PokerGame {
    private var cardDeck = CardDeck()
    private var players: [[Card]] = [[]]
    
    enum PlayerCount: Int {
        case one = 1, two, three, four
    }
    enum CardStud: Int {
        case five = 5
        case seven = 7
    }
    
    let playerCount: PlayerCount
    let cardStud: CardStud
    
    init(playerCount: PlayerCount, cardStud: CardStud) {
        self.playerCount = playerCount
        self.cardStud = cardStud
        cardDeck.makeCardDeck()
        cardDeck.shuffle()
    }
    
    func handoutCards() {
        for player in 0..<players.count {
            for _ in 0..<cardStud.rawValue {
                players[player].append(cardDeck.removeOne()!)
            }
        }
    }
    
    func makePlayer() {
        for _ in 0..<playerCount.rawValue {
            let player: [Card] = []
            players.append(player)
        }
    }
    
    func start() {
        makePlayer()
        handoutCards()
        print("\(cardStud.rawValue)카드 기준, 참가자 \(player.rawValue)일 때")
        for i in 0..<players.count - 1 {
            print("player\(i+1): \(players[i])")
        }
        print("dealer: \(players[players.count - 1])")
    }
}
