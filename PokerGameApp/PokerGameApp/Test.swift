//
//  Test.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation

struct Test {
    private var deck : CardDeck
    
    init() {
        deck = CardDeck()
    }
    
    mutating func startTest() {
        print("> 카드초기화")
        print("카드 전체를 초기화 했습니다.")
        print("총 \(deck.count())장의 카드가 있습니다.\n")
        
        print("> 카드 섞기")
        deck.shuffle()
        print("전체 \(deck.count())장의 카드를 섞었습니다.\n")
        
        print("> 카드 하나 뽑기")
        print(deck.removeOne() ?? "모든 카드를 뽑았습니다")
        print("총 \(deck.count())장의 카드가 남았습니다.")
        
        print("> 카드 하나 뽑기")
        print(deck.removeOne() ?? "모든 카드를 뽑았습니다")
        print("총 \(deck.count())장의 카드가 남았습니다.")
    }
}
