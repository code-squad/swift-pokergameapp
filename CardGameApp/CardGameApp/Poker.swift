//
//  Poker.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

class Poker {
    enum Stud: Int {
        case fiveCard = 5, sevenCard = 7
        func forEach(_ closure: () -> ()) {
            for _ in 0..<self.rawValue {
                closure()
            }
        }
        func forEach(_ closure: (Int) -> ()) {
            for index in 0..<self.rawValue {
                closure(index)
            }
        }
    }
    
    enum NumberOfPlayers: Int {
        case two = 2, three, four
        func forEach(_ closure: () -> ()) {
            for _ in 0..<self.rawValue {
                closure()
            }
        }
        func forEach(_ closure: (Int) -> ()) {
            for index in 0..<self.rawValue {
                closure(index)
            }
        }
    }
    
    enum HandCombinations {
        case none, onePair, twoPair, threeOfAKind, straight, fourOfAKind
    }
    
    private var stud: Stud
    private var numberOfPlayers: NumberOfPlayers
    private var players: Players
    private var dealer: Dealer
    
    init(stud: Stud, numberOfPlayers: NumberOfPlayers) {
        self.stud = stud
        self.numberOfPlayers = numberOfPlayers
        self.players = Players(with: numberOfPlayers)
        self.dealer = Dealer()
    }
    
    func start() {
        dealer.shuffle()
        stud.forEach {
            players.receive(dealer.card)
            dealer.receive(dealer.card())
        }
    }
    
    func canContinue() -> Bool {
        return dealer.canContinue(stud: stud, numberOfPlayers: numberOfPlayers)
    }
    
    func playersHands() -> [[Card]] {
        return players.allHands()
    }
    
    func dealerHands() -> [Card] {
        return dealer.allHands()
    }
}
