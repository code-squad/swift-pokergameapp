//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by jinseo park on 3/16/21.
//

import Foundation


class CardDeck : CustomStringConvertible{
    enum PrintOption{
        case Pick,Shuffle,Reset
    }
    
    var description: String {
        switch info {
        case .Pick:
            return "\(String(describing: self.aCard)), \n 총 \(self.countOfDeck) 카드 존재"
        case .Shuffle:
            return "카드를 섞음\n 총 \(self.deck.count) 카드 존재"
        case .Reset:            
            return "카드를 초기화 함\n 총 \(self.deck.count) 카드 존재"
        case .none:
            return "none"
        }
    }
    
    private var deck : [Card] = []
    private var countOfDeck : Int {
        return deck.count
    }
    private var info : PrintOption?
    private var aCard : Card?
    
    init() {
        //52장 총 4종류의 13개씩 있어야한다.
        resetDeck()
    }
    
    func pickOneCard() -> Card {
        info = .Pick
        let card = self.deck.removeLast()
        self.aCard = card
        return card
    }
    
    /* Durstenfeld's version Shuffle a Deck. */
    func shuffleDeck() {
        info = .Shuffle
        var newDeck : [Card] = []
        while countOfDeck > 0 {
            let randNum = Int.random(in: 0 ..< countOfDeck)
            (self.deck[countOfDeck - 1], self.deck[randNum]) = (self.deck[randNum], self.deck[countOfDeck - 1])
            newDeck.append(self.deck.removeLast())
        }
        self.deck = newDeck

    }
    
    /* Reset the card. */
    func resetDeck() {
        info = .Reset
        self.deck.removeAll()
        /* append all kind of cards to deck. */
        SuitCard.allCases.forEach {
            let suit = $0
            NumberOfCard.allCases.forEach {
                let numberOfCard = $0
                self.deck.append(Card.init(suit, numberOfCard))
            }
        }

    }
    
    func showCardDeck() {
        print(self.deck)
    }
    
}


