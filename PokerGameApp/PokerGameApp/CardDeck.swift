//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var deck: [Card] = []
    
    init() {
        makeCardDeck()
    }
    
    private mutating func makeCardDeck() {
        Suit.allCases.forEach { suit in
            Rank.allCases.forEach { rank in
                deck.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle() {
        deck = deck.enumerated().filter { index, card in index < deck.count-1 }.map{ (index, card) -> Card in
            let targetCardNumber = Int.random(in: index+1...deck.count-1)
            let temp = deck[targetCardNumber]
            deck[targetCardNumber] = card
            return temp
        }
    }
    
    
    mutating func removeOne() -> Card? {
        return deck.popLast()
    }
    
    mutating func reset() {
        deck.removeAll()
        makeCardDeck()
    }
    
    mutating func sevenStudCards() -> [Card]? {
        var newCards:[Card] = []
        
        for _ in 0...6 {
            guard let newCard = self.removeOne() else {
                print("카드 부족 게임 종료")
                return nil
            }
            
            newCards.append(newCard)
        }
        return newCards
    }
    
    mutating func fiveStudCards() -> [Card]?{
        var newCards:[Card] = []
        
        for _ in 0...4 {
            guard let newCard = self.removeOne() else {
                print("카드 부족 게임 종료")
                return nil
            }
            
            newCards.append(newCard)
        }
        return newCards
    }
}
