//
//  TESTCode.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/18.
//

import Foundation

class TESTCode{
    private let TESTdeck : Deck
    
    init(){
        TESTdeck = Deck()
    }
    
    func excuteTest()-> Void{
        
        TESTdeck.createDeck()
        print("> 카드 초기화")
        print("카드 전체를 초기화 했습니다.")
        print("총 \(TESTdeck.getDeckCount())장의 카드가 있습니다.")
        
        TESTdeck.shuffleDeck()
        print("> 카드 섞기")
        print("> 카드 전체를 섞었습니다.")
        print(TESTdeck.getCurrentdeck())
        
        TESTdeck.takeOnecard()
        print("> 카드 하나 뽑기")
        print("> 총 \(TESTdeck.getDeckCount())장의 카드가 남아있습니다.")
        
        TESTdeck.takeOnecard()
        print("> 카드 하나 뽑기")
        print("> 총 \(TESTdeck.getDeckCount())장의 카드가 남아있습니다.")
    }
}
