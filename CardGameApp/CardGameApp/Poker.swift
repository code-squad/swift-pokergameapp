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
    
    enum Hand: Int, Comparable, Equatable {
        case highCard = 0, onePair, twoPair, threeOfAKind, straight, fourOfAKind
        static func < (lhs: Self, rhs: Self) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        static func == (lhs: Int, rhs: Self) -> Bool {
            return lhs == rhs.rawValue
        }
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
    
    func playersCards() -> [[Card]] {
        return players.allCards()
    }
    
    func dealerCards() -> [Card] {
        return dealer.allCards()
    }
}
