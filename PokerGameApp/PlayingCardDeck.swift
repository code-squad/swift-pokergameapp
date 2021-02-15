//
//  PlayingCardDeck.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

struct PlayingCardDeck {
    
    private var count : Int {
        get {
            return cards.count
        }
    }
    private var cards  = [PlayingCard]()
    
    init(){
        initialize()
    }
    
    mutating func initialize(){
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
        print("카드 전체를 초기화했습니다.")
        print("총 \(count)장의 카드가 있습니다.")
    }
    
    mutating func suffle(){
        cards.shuffle()
        print("전체 \(count)장의 카드를 섞었습니다.")
    }
    
    mutating func removeOne(){
        
        guard let removed = cards.popLast() else {
            print("남아있는 카드가 없습니다.")
            return
        }
        print(removed.description)
        print("총 \(count)장의 카드가 남아있습니다.")
    }
    
    mutating func reset(){
        cards.removeAll()
        initialize()
    }
}
