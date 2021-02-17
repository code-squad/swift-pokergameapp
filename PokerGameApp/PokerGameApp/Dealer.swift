//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation



class Dealer : Player{
    private var cardDeck: CardDeck
    private var cards:[Card] = []
    private var stud: Event
    
    init(stud : Event) {
        self.cardDeck = CardDeck()
        self.stud = stud
    }
    
    func give() -> [Card]? {
        return cardDeck.give(number: stud)
    }
    
    func distribute(with players: Players) -> Bool{
        players.distribute(with: self)
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
    
    override func printDeck() {
        print("딜러#  \(cards)")
    }
}
