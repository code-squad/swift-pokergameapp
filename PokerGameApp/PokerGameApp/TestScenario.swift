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
        printInit()

        deck.shuffle()
        printShuffle()
        
        printRemoveOne()
        printRemoveOne()
        
        deck.reset()
        printInit()
    }
    
    private func printInit() {
        print("카드 전체를 초기화했습니다\n총 \(deck.count())의 카드가 있습니다")
    }
    
    private func printShuffle() {
        print("전체 \(deck.count())장의 카드를 섞었습니다")
    }
    
    private mutating func printRemoveOne() {
        guard let card = deck.removeOne() else { return }
        print("\(card)\n총 \(deck.count())의 카드가 있습니다")
    }
    
}
