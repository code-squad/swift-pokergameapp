//
//  TestScenario.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

struct Scenario {
    
    private var deck = CardDeck()
    
    mutating func scene() {
        initPrint()
        countPrint()
        
        deck.shuffle()
        shufflePrint()
        
        removeOnePrint()
        removeOnePrint()
        
        deck.reset()
        initPrint()
        countPrint(deck: deck)
    }
    
    private func initPrint() {
        print("카드 전체를 초기화했습니다")
    }
    
    private func countPrint(deck : CardDeck) {
        print("총 \(deck.count())의 카드가 있습니다")
    }
    
    private func countPrint() {
        print("총 \(deck.count())의 카드가 있습니다")
    }
    
    private func shufflePrint() {
        print("전체 \(deck.count())장의 카드를 섞었습니다")
    }
    
    private mutating func removeOnePrint() {
        guard let card = deck.removeOne() else { return }
        print("\(card)\n총 \(deck.count())의 카드가 있습니다")
    }
    
}
