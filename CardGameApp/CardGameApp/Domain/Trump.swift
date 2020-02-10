//
//  Trump.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/10.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

public class Trump {
    
    func printTrumpInfo(){
        print(suit.rawValue, terminator:"")
        switch number {
        case .ace:
            print("A")
        case .jack:
            print("J")
        case .queen:
            print("Q")
        case .king:
            print("K")
        default:
            print(number.rawValue)
        }
    }
    
    init(suit : Suit, number : Number) {
        self.suit = suit
        self.number = number
    }
    
    private let suit : Suit
    private let number : Number
    
    enum Suit : String {
        case spade = "♠"
        case heart = "♥"
        case diamond = "♦"
        case club = "♣"
    }
    
    enum Number : Int {
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
}
