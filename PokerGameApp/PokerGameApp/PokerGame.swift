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

        func makePlayers() -> [Player] {
            var players = [Player]()
            
            for i in 1...self.rawValue {
                players.append(Player(name: .player, number: i))
            }
            return players
        }
    }
    
    private var infoBoard: InfoBoard
    
    private var dealer: Dealer

    private var participants: Participants
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
        infoBoard = InfoBoard()
        dealer = Dealer(name: .dealer, with: cardDeck)
        participants = Participants(players: seat.makePlayers(), dealer: dealer)
    }
    
    func start() {
        
        let newStacks = cardsFromDealer()
        
        participants.takeCard(from: newStacks)
        updateInfoBoard()
    }
    
    private func cardsFromDealer() -> [[Card]] {
        let newStacks = dealer.handOutCardStacks(for: participants.count(),
                                                 each: rule.cardCount())
        return newStacks
    }
    
    private func updateInfoBoard() {
        infoBoard.update(participantsList: participants.names())
        infoBoard.update(cardStackList: participants.stacks())
    }
}
