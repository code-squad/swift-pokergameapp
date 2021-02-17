//
//  Test.swift
//  PokerGameApp
//
//  Created by user on 2021/02/17.
//

import Foundation

struct ActionTest {
    var cards = CardDeck()
    
    mutating func resetTest() {
        cards.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cards.count)장의 카드가 있습니다.")
    }
    
    mutating func shuffleTest() {
        cards.shuffle()
        print("전체 \(cards.count)의 카드를 섞었습니다.")
    }
    
    mutating func removeOneTest() {
        if let card = cards.removeOne() {
            print(card)
            print("총 \(cards.count)장의 카드가 남아있습니다.")
        } else {
            print("남아있는 카드가 없어 뽑을 수 없습니다.")
        }
    }
    
    mutating func startTest() {
        self.resetTest()
        self.shuffleTest()
        
        for _ in 0...51 {
            self.removeOneTest()
        }
        
        self.removeOneTest()
        self.resetTest()
        self.shuffleTest()
    }
}
