//
//  Deck.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/17.
//

import Foundation

class Deck{
    private var deck : [Card] = []
    
    func createDeck(){
        if deck.count > 0{
            deck.removeAll()
            createDeck()
        }
        else{
            Suit.allCases.forEach{ suit in
                Number.allCases.forEach{ num in
                    deck.append(Card.init(suit: suit, number: num))
                }
            }
        }
    }
    
    func getDeckCount() -> Int{
        return deck.count
    }
    
    func getCurrentdeck() -> [Card]{
        return deck
    }
    
    func shuffleDeck() -> Void{
        if deck.count != 0{
            for i in 0..<deck.count - 1{
                let randomIndex = Int.random(in: i..<deck.count)
                
                let temp = deck[i]
                deck[i] = deck[randomIndex]
                deck[randomIndex] = temp
            }
        }
        else {
            print("덱이 비어있습니다.")
        }
    } // 이 부분 shuffle 시작 하는 부분에 옵셔널 바인딩으로 if var deckTemp = deck {} 으로 진행하려 했으나 덱을 옵셔널로 두고 nil을 부여하면 createDeck을 실행해도 덱이 초기화 되질 않습니다. 이런 경우 옵셔널 바인딩 보단 그냥 덱의 count가 0일 경우로 처리하는 것이 더 권장되는 방향일까요?
    
    func takeOnecard(){
        let randomIndex = Int.random(in: 0..<deck.count)
        
        print(deck[randomIndex].description)
        deck.remove(at: randomIndex)
    }
}
