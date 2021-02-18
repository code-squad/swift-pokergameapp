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
    
    private var dealer: Dealer

    private var participants = [Participant]()
    
    private var infoBoard = InfoBoard()
    
    init(rule: Rule, seat: Seat) {
        self.rule = rule
        self.seat = seat
        self.dealer = Dealer(name: .dealer, with: cardDeck, infoBoard)
        self.participants = seat.makePlayers()
        
        addDealer()
        updateBoardParticipantsList()
    }
    
    private func addDealer() {
        participants.append(dealer)
    }
    
    private func updateBoardParticipantsList() {
        infoBoard.participantsList = participants.map { $0.myName() }
    }
    
    func start() -> String {
        takeCard()
        return infoBoard.description
    }
    
    private func takeCard() {
        if let cardStacks = dealer.handOutCardStacks(for: participants.count,
                                                     each: rule.cardCount()) {
            for (i, cards) in cardStacks.enumerated() {
                self.participants[i].updateStack(with: cards)
            }
            updateBoard(with: cardStacks)
        }
    }
    
    private func updateBoard(with currentStacks: [[Card]]) {
        infoBoard.cardStackList = currentStacks
    }
}
