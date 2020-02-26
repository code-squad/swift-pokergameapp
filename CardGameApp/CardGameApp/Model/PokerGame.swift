//
//  PokerGame.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class PokerGame {
    private let dealer = Dealer()
    private var players = Players()
    private var studNumber: Stud
    
    enum Stud: Int, CaseIterable {
        case seven = 7
        case five = 5
        
        init(index: Int) {
            self = Stud.allCases[index]
        }
        
        func foreach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    enum PlayerCount: Int, CaseIterable {
        case one = 1, two, three, four
        
        init(index: Int) {
            self = PlayerCount.allCases[index]
        }
        
        func foreach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    init(playerCount: PlayerCount, stud: Stud) {
        self.studNumber = stud
        playerCount.foreach {
            self.players.append(player: Player())
        }
    }
    
    func allocateCards() {
        dealer.shuffle()
        studNumber.foreach {
            players.forEachPlayer { (player) in
                guard let card = dealer.removeOne() else { return }
                player.appendCard(card)
            }
            guard let card = dealer.removeOne() else { return }
            dealer.appendCard(card)
        }
    }
    
    func leftCards() -> Int {
        return dealer.leftCards()
    }
    
    func forEachPlayer(handler: (Player) -> ()) {
        players.forEachPlayer { (player) in
            handler(player)
        }
    }
    
    func forEachDealerCards(handler: (Card) -> () ) {
        dealer.forEachCard(handler: handler)
    }
    
    func compareResults() {
        var gameResult = GameResult.none
        var equalParticipants: [Player] = []
        let dealerResult = dealer.result()
        let resultWithEqaulParticipants = players.compare()
        equalParticipants = resultWithEqaulParticipants.equalParticipants
        gameResult = resultWithEqaulParticipants.result
        
        if dealerResult > gameResult {
            equalParticipants.removeAll()
            equalParticipants.append(dealer)
        }else if dealerResult == gameResult {
            equalParticipants.append(dealer)
        }
        
        if equalParticipants.count > 1 {
            compareParticipantsCardNumber(equalParticipants: equalParticipants)
        }else {
            equalParticipants[0].winGame()

        }
    }
    
    func compareParticipantsCardNumber(equalParticipants: [Player]) {
        var equalParticipants = equalParticipants
        var biggestCard = Card(number: .one, pattern: .clover)
        
        while equalParticipants.count > 1 {
            for participant in equalParticipants {
                var cards = participant.sortCards()
                let lastCard = cards.removeFirst()
                if biggestCard <= lastCard {
                    biggestCard = lastCard
                }else {
                    if let index = equalParticipants.firstIndex(of: participant){
                        equalParticipants.remove(at: index)
                    }
                }
            }
        }
        
        equalParticipants[0].winGame()
    }
    
    func judgeDealerWin() -> Bool {
        return dealer.isWinner
    }
}

