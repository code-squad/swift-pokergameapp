//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame {
    
    private let cardDeck = CardDeck()

    private var rule: Rule
    
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        func cardCount() -> Int {
            return self.rawValue
        }
    }
    
    private var seat: Seat

    enum Seat: Int {
        case one = 1, two, three, four
        
        func count() -> Int {
            return self.rawValue + 1 //딜러 몫 추가
        }
    }
    
    var dealer: Dealer
    
    private var participants = [Participant]()
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
        self.dealer = Dealer(name: .dealer, cardDeck: self.cardDeck)
        addParticipants()
    }
    
    private func addParticipants() {
        for i in 1..<seat.count() {
            participants.append(Player(name: .player, number: i))
        }
        participants.append(self.dealer)
    }
    
    func start() -> String {
        if let cardStacks = dealer.startGame(with: self.rule, self.seat) {
            for (i, stack) in cardStacks.enumerated() {
                self.participants[i].updateMyStack(with: stack)
            }
        } else {
            return dealer.endGame()
        }
        return self.description + dealer.deckInfo()
    }
}

extension PokerGame: CustomStringConvertible {
    
    var description: String {
        var gameStatus = ""
        
        for participant in participants {
            gameStatus += "\(participant)\n"
        }
        return gameStatus
    }
}
