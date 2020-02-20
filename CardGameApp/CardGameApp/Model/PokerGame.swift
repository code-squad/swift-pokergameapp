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
        dealer.forEach(handler: handler)
    }
    
    func compareResults() -> Playable {
        var winnerResult = Player().result()
        var winner: Playable = Player()
        
        players.forEachPlayer { (player) in
            let result = player.result()
            if winnerResult.rawValue < result.rawValue {
                winnerResult = result
                winner = player
            }
        }
        
        let dealerResult = dealer.result()
        if winnerResult.rawValue < dealerResult.rawValue {
            winner = dealer
        }
        
        return winner
    }
    
    
}
