//
//  Deck.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/18.
//

import Foundation

struct Deck  {
    enum errors : Error {
        case noMoreCardError
    }
    
    private var cards : [PlayingCard]
    
    init() {
        self.cards = []
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    mutating func shuffle() {
        for index in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: 0..<cards.count)
            cards.swapAt(index, randomIndex)
        }
    }
    
    ///removeOne 기능
    mutating func popOneCard() throws -> PlayingCard {
        guard let returnCard = cards.popLast() else {
            throw Deck.errors.noMoreCardError
        }
        return returnCard
    }
    
    mutating func removeDeck() {
        self.cards.removeAll()
    }
    
    mutating func newDeck() {
        self.cards.removeAll()
        self.cards = { () -> [PlayingCard] in
            var initDeck = [PlayingCard]()
            for suit in Suits.allCases {
                for number in Rank.allCases {
                    initDeck.append(PlayingCard.init(suit: suit, number: number))
                }
            }
            return initDeck
        }()
    }
    
    func printCards() {
        if self.count() == 0 {
            print("Deck or Hand is empty")
            return
        }
        for index in 0..<self.count() {
            print(cards[index], terminator: " ")
        }
        print("")
    }
    
    func allCardsAsString() -> String {
        var strArray = [String]()
        for card in cards {
            strArray.append(card.description)
        }
        let returnString = strArray.reduce("", {
            return $0 + $1
        })
        return returnString
    }
    
    func allCards() -> [String] {
        var strArray = [String]()
        for card in cards {
            strArray.append(card.description)
        }
        return strArray
    }
    
    mutating func addingNewCard(with newCard : PlayingCard) {
        self.cards.append(newCard)
    }
}
