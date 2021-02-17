//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame {

    var rule: Rule
    
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
    var seat: Seat

    enum Seat: Int {
        case one = 1, two, three, four
    }
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
    }
    
    func start() -> String {
        return ""
    }

}

class Dealer: PokerGame {
    
    private let P = PrintFactory()
    
    private var cardDeck = CardDeck()
    private var players = [Player]() //pokerGame의 nested가 나을 것 같음
    
    private struct Player: CustomStringConvertible {
        let name: String
        var cards: [Card]
        
        init(name: String,_ cards: [Card]) {
            self.name = name
            self.cards = cards
        }
        
        var description: String {
            return "\(name)의 카드: \(cards)\n"
        }
    }
    
    override func start() -> String {
        var gameStatus = super.start()
        resetPlayer()
        
        gameStatus += P.shuffleMessage(with: cardDeck.shuffle())
        gameStatus += handOutCards()
        
        return gameStatus
    }
    
    private func resetPlayer() {
        players = []
    }
    
    private func handOutCards() -> String {
        for i in 1...super.seat.rawValue {
            if let cards = cardStack() {
                players.append(Player(name: "참가자 #\(i)", cards))
            } else {
                return endGame()
            }
        }
        return makeDealerStack()
    }
    
    private func cardStack() -> [Card]? {
        var cards = [Card]()
        
        for _ in 0..<super.rule.rawValue {
            if let card = cardDeck.removeOne() {
                cards.append(card)
            } else {
                return nil
            }
        }
        return cards
    }
    
    private func makeDealerStack() -> String {
        if let cards = cardStack() {
            players.append(Player(name: "딜러", cards))
        } else {
            return endGame()
        }
        return allSet()
    }
    
    private func allSet() -> String {
        var playerStatus = ""
        
        for player in players {
            playerStatus += player.description
        }
        return playerStatus
    }
    
    private func endGame() -> String {
        return "덱에 카드가 모자라서 게임을 종료합니다"
    }
}

