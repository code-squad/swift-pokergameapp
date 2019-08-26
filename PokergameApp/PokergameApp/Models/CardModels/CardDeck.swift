//
//  CardDeck.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cardList : [Card]
    var deckSize : Int {
        return cardList.count
    }
    
    init(){
        self.cardList = [Card]()
        fillCardList()
        shuffleDeck()
    }

    mutating func resetCardDeck() {
        self.cardList.removeAll()
        fillCardList()
        shuffleDeck()
    }
    
    mutating func drawCard() -> Result<Card, DrawCardError> {
        guard let drawOne = cardList.popLast() else {
            return .failure(.noMoreCardInDeck)
        }
        return .success(drawOne)
    }
    
    ///카드 셔플 by mordern method
    //    for i from n−1 downto 1 do
    //    j ← random integer such that 0 ≤ j ≤ i
    //    exchange a[j] and a[i]
    mutating func shuffleDeck() {
        for index in 0..<deckSize {
            let randomNumber = Int.random(in: 0..<deckSize-index)
            if randomNumber != index {
                self.cardList.swapAt(index, randomNumber)
            }
        }
    }
    
    private mutating func fillCardList() {
        for type in CardType.allCases {
            fillCardListByType(cardType: type)
        }
    }
    
    ///타입별로 카드 생성
    private mutating func fillCardListByType(cardType: CardType) {
        for cardNumber in CardNumber.allCases{
            self.cardList.append(Card(type: cardType, number: cardNumber))
        }
    }
}
