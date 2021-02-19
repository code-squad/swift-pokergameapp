//
//  Deck.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/17.
//

import Foundation

class Deck{
    private var deck : [Card]
    
    init(){
        deck = []
    }
    
    func resetDeck(){
        deck.removeAll()
        createDeck()
    }
    
    func createDeck(){
        Suit.allCases.forEach{ suit in
            Number.allCases.forEach{ num in
                deck.append(Card.init(suit: suit, number: num))
            }
        }
    }
    
    func isEmpty() -> Bool{
        if deck.count > 0 { return false }
        return true
    }
    
    func count() -> Int{
        return deck.count
    }
    
    enum errorOfDeck : Error{
        case empty
    }
    
    func shuffleDeck() -> Void{
        if deck.count < 1{
            return
        }
        for i in 0..<deck.count - 1{
            let randomIndex = Int.random(in: i..<deck.count)
            
            let temp = deck[i]
            deck[i] = deck[randomIndex]
            deck[randomIndex] = temp
        }
    }
    
    func takeRandomcard() -> Card{
        let randomIndex = Int.random(in: 0..<deck.count)
        
        return deck[randomIndex]
    }
    
    func takeTopcard() -> Card{
        return deck[0]
    }
    
    func removeTopCard(){
        deck.removeFirst()
    }
}
