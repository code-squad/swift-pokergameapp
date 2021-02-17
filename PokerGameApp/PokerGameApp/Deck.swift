//
//  Deck.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/17.
//

import Foundation

class Deck{
    private let TOTALCARD : Int = 52
    private var currentCount : Int = 52
    
    func createDeck(){
        var deck : [Card] = []
        Suit.allCases.forEach{ suit in
            Number.allCases.forEach{ num in
                deck.append(Card(suit: suit, number: num))
            }
        }
        print(deck)
    }
    
    func shuffle() -> Void{
        
    }
}
