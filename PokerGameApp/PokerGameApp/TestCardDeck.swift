//
//  TestCardDeck.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/16.
//

import Foundation

struct Test {

    var deck = cardDeck()
    
    mutating func initializeCard() {
        deck.makeCardDeck()
        print("> 카드 초기화")
        print("카드 전체를 초기화했습니다.")
        print("총 \(deck.count())장의 카드가 있습니다.")
    }
    
    mutating func shuffleCard() {
        print("> 카드 섞기")
        deck.shuffle()
        print("전체 \(deck.count())의 카드를 섞었습니다.")
    }
    
    mutating func pickCard() {
        print("> 카드 하나 뽑기")
        if let removedCard = deck.removeOne() {
            print(removedCard)
        }
        print("총 \(deck.count())장의 카드가 남아있습니다.")
    }
    
    
    mutating func startTest() {
        initializeCard()
        shuffleCard()
        for _ in 0...51 {
            pickCard()
        }
    }
}
