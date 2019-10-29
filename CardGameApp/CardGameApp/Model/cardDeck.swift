//
//  cardDeck.swift
//  CardGame
//
//  Created by Elena on 24/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol CardGameSet{
    func count() -> Int
    mutating func shuffle()
    mutating func removeOne() -> Card?
    mutating func reset()
}

struct CardDeck: CardGameSet{

    private var cards: [Card] = []
    
    init() {
        reset()
    }
    
    // 갖고 있는 카드 개수를 반환
    func count() -> Int {
        return cards.count
    }
    // 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle() {
        cards.shuffle()
    }
    // 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne() -> Card? {
        if isEmpty {
            return nil
        }
        return cards.removeFirst()
    }
    // 처음처럼 모든 카드를 다시 채워 넣는다.
    mutating func reset() {
        cards.removeAll()
        addAllFiller()
        shuffle()
    }
    
    // 전체 채우기
    private mutating func addAllFiller() {
        for shape in Shape.allCases {
            for number in Number.allCases {
                self.cards.append(Card(number: number, shape: shape))
            }
        }
    }
    
    // 카드가 비어있는지 확인하기 위해 만듬.
    var isEmpty: Bool {
        return cards.isEmpty
    }
   
}

extension CardDeck {
    // 카드 인스턴스를 매개변수만큼 만들어서 반환하고 목록에서 삭제한다.
    mutating func removeMultiple(_ number: Int) -> CardStack? {
        guard number > 0 else { return nil }
        var cardsRemoved: [Card] = []
        for _ in 0..<number {
            guard let cardRemoved = removeOne() else { break }
            cardsRemoved.append(cardRemoved)
        }
        return CardStack.init(cards: cardsRemoved)
    }
}
