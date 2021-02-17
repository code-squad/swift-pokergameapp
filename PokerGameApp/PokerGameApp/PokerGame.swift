//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame: CustomStringConvertible {

    var rule: Rule
    
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        func cardCount() -> Int {
            return self.rawValue
        }
    }
    
    var seat: Seat

    enum Seat: Int {
        case one = 1, two, three, four
        
        func count() -> Int {
            return self.rawValue + 1 //딜러 몫 추가
        }
    }
    
    fileprivate var players = [Player]()
    
    fileprivate struct Player {
        let name: String
        var cards: [Card]?
        
        init(name: String) {
            self.name = name
        }
    }
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
        addPlayers()
        addDealer()
    }
    
    private func addPlayers() {
        for i in 1..<seat.count() {
            players.append(Player(name: "참가자 #\(i)"))
        }
    }
    
    private func addDealer() {
        players.append(Player(name: "딜러"))
    }
    
    var description: String {
        var status = ""
        
        for player in players {
            if let cards = player.cards {
                status += "\(player.name): \(cards)\n"
            }
        }
        return status
    }
}

class Dealer: PokerGame {
    
    private var cardDeck = CardDeck()
    private let P = PrintFactory()
    
    func start() -> String {
        let cardNeeded = seat.count() * rule.cardCount()
        guard cardDeck.count() >= cardNeeded else { return P.endMessage() }
        
        var gameStatus = ""
        
        gameStatus += P.shuffleMessage(with: cardDeck.shuffle())
        gameStatus += handOutCards()
        
        return gameStatus
    }
    
    private func handOutCards() -> String {
        for i in 0..<seat.count() {
            if let cards = cardStack() {
                super.players[i].cards = cards
            } else {
                return P.endMessage()
            }
        }
        return allSet()
    }
    
    private func cardStack() -> [Card]? {
        var cards = [Card]()
        
        for _ in 0..<rule.cardCount() {
            if let card = cardDeck.removeOne() {
                cards.append(card)
            } else {
                return nil
            }
        }
        return cards
    }
    
    private func allSet() -> String {
        return "\(description)"
    }
}
