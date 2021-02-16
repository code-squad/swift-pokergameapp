//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation


struct CardDeck{
    private var currentCardDeck: Array<String> = []
    
    private func generateCardSet() -> Array<String> {
        var result: Array<String> = []
        let suitArray: Array<String> = ["♠️","♥️","♦️","☘️"]
        let valueArray: Array<String> = ["1","2","3","4","5","6","7","8","9","10","J","Q","K"]
        
        for suit in suitArray {
            for value in valueArray {
                result.append("\(suit)\(value)")
            }
        }
        return result
    }
    
    private init() {
        currentCardDeck = generateCardSet()
    }
    
    func count() -> Int {
        return currentCardDeck.count
    }
    
    mutating func shuffle() {
        currentCardDeck.shuffle()
    }
    
    mutating func removeOne() -> String {
        let draw = currentCardDeck.popLast() ?? "No card left"
        return draw
    }
    
    mutating func reset() {
        currentCardDeck = generateCardSet()
    }
}
