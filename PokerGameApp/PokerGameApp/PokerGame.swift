//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/17.
//

import Foundation

class PokerGame: CustomStringConvertible {
    
    private var players: [Player] = []
    private var dealer: Dealer
    
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
        self.dealer = Dealer()
        self.playerCount = playerCount
        self.cardStud = cardStud
    }
    
    func makeGamePlayer()  {
        for _ in 0..<playerCount.rawValue {
            players.append(Player())
        }
    }
    
    func distributeCard() {
        for _ in 0..<cardStud.rawValue {
            for player in players {
                if let card = dealer.handOutCard() {
                    player.receiveCard(card: card)
                }
            }
            dealer.makeDealerCard()
        }
    }
    
    var description: String{
        var result: String = ""
        for i in 0..<playerCount.rawValue {
            result += "player\(i+1): \(players[i])\n"
        }
        result += "dealer: \(dealer)"
        return result
    }
}
