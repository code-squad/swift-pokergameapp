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
        Card.Suit.allCases.forEach{ suit in
            Card.Rank.allCases.forEach{ rank in
                deck.append(Card.init(suit: suit, rank: rank))
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
    
    func removeCard(Card : Card){ //테스트 코드 출력용
        for i in 0..<deck.count{
            if deck[i].description == Card.description {
                deck.remove(at: i)
                break;
            }
        }
    }
    
    func takeTopcard() -> Card{
        return deck[0]
    }
    
    func removeTopCard(){
        deck.removeFirst()
    }
}
