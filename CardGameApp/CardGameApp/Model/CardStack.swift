//
//  CardStack.swift
//  CardGame
//
//  Created by Elena on 31/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//카드[] 데이터 만들기
// 카드게임 데이터를 한사람의 하나씩 구조로 만들어서 카드스택으로 쌓으려고 선택
class CardStack: CustomStringConvertible {
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func add(_ card: Card) {
        cards.append(card)
    }
    
    func reset() {
        cards.removeAll()
    }
    
    var description: String {
        let cardLump = cards.map { "\($0)" }.joined(separator: ", ")
        return "[\(cardLump)]"
    }
    
    func getCardData() -> [Card] {
        return cards
    }
 
}
