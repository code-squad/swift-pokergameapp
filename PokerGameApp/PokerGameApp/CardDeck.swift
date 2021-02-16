//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/16.
//

import Foundation

struct CardDeck {
    var cards: [Card] = []
    init() {
        for i in 1...13 {
            self.cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.clobers))
            self.cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.diamonds))
            self.cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.hearts))
            self.cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.spades))
        }
    }
    func count() -> Int {
        return self.cards.count
    }
    mutating func shuffle() {
        for i in 0..<self.cards.count-1 {
            let randomIndex = Int.random(in: 1..<self.cards.count)
            let temp = self.cards[i]
            
            self.cards[i] = self.cards[randomIndex]
            self.cards[randomIndex] = temp
        }
        print(self.cards)
    }
    mutating func removeOn() -> Card?{
        if let removeCard = self.cards.popLast() {
            return removeCard
        } else {
            print("CardDeck에 Card가 존재하지 않습니다.")
            return nil
        }
    }
}
