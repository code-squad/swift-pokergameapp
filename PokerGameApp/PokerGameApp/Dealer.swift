//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation



class Dealer{
    private var cardDeck: CardDeck
    private var cards:[Card] = []
    private var stud: Int
    
    init(stud :Int) {
        self.cardDeck = CardDeck()
        self.stud = stud
    }
    
    func give() -> [Card]? {
        return cardDeck.give(number: stud)
    }
    
    func distributePlayers(with players: Players) -> Bool{
        players.distributeCards(with: self)
        return true
    }
    
    func takeDealerCards() -> Bool {
        guard let newCards = cardDeck.give(number: stud) else {
            return false
        }
        self.cards = newCards
        return true
    }
    
    func shuffle() {
        cardDeck.shuffle()
    }
    
    func printDeck() {
        print("딜러#  \(cards)")
    }
}
