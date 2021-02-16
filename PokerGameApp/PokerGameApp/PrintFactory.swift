//
//  PrintFactory.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct PrintFactory {
    
    let shuffleMessage = "덱의 카드를 섞었습니다"
    let resetMessage = "덱을 리셋했습니다"
    
    func deckCount(_ count: Int) -> String {
        return "현재 \(count)장의 카드가 있습니다"
    }
    
    func deckContents(from deck: [Card]) -> String {
        return "현재 덱의 구성: \(deck)"
    }
    
    func cardInfo(from card: Card?) -> String {
        if let card = card {
            return "현재 카드: \(card)"
        } else {
            return "덱에 카드가 없습니다"
        }
    }
}
