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
    }
    
    private var dealer: Dealer

    private var participants: Participants
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
        dealer = Dealer(with: cardDeck)
        participants = Participants(playerCount: seat.rawValue, dealer: dealer)
    }
    
    func start() {
        
        let newStacks = cardsFromDealer()
        
        participants.takeCard(from: newStacks)
    }
    
    private func cardsFromDealer() -> [[Card]] {
        let newStacks = dealer.handOutCardStacks(for: participants.count(),
                                                 each: rule.cardCount())
        return newStacks
    }
    
    func changeRule(to newRule: Rule) {
        rule = newRule
    }
    
    func changeSeat(to newSeat: Seat) {
        seat = newSeat
        participants = Participants(playerCount: seat.rawValue, dealer: dealer)
    }
    
    func newView(handler: ([String], [[Card]]) -> ()) {
        handler(participants.names(), participants.stacks())
    }
}
