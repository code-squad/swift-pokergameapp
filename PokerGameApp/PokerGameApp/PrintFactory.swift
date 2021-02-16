//
//  PrintFactory.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct PrintFactory {
    
    func deckCountInfo(from count: Int) -> String {
        return "덱에 \(count)장의 카드가 있습니다.\n"
    }
    
    func cardDrawn(card: Card?, remainingCount: Int) -> String {
        if let card = card {
            return "> 카드 뽑기\n현재 카드: \(card)\n\(deckCountInfo(from: remainingCount))"
        } else {
            return "덱에 카드가 없습니다.\n"
        }
    }
    
    func shuffleMessage(with shuffleCount: Int) -> String {
        return "> 카드 섞기\n총 \(shuffleCount)장의 카드를 섞었습니다\n"
    }
    
    func resetMessage(with deckCount: Int) -> String {
        return "> 카드 초기화\n덱을 초기화했습니다.\n\(deckCountInfo(from: deckCount))"
    }
}
