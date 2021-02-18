//
//  GameDealer.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/17.
//

import Foundation

import Foundation

 // 참가자 모집
 // 덱 준비
 // distribute

 class Dealer: CardDeck {
    
    public var player: Array<Players> = []

    public var playerNum = 1
         public var cardStud = 5

         public func recruitPlayer() {
             for i in 1...playerNum {
                 player.append(Players(name: "Player\(i)", hand: []))
             }
             player.append(Players(name: "Dealer", hand: []))
         }

         public func makeDeckForGame() {
             make()
         }

         public func distributeCard() {
             for _ in 1...cardStud {
                 for i in 0..<player.count-1 {
                     player[i].hand.append(deck[0])
                     removeOne()
                 }
                 player[player.endIndex-1].hand.append(deck[0])
                 removeOne()
             }

             for j in 0..<player.count {
                 print(player[j].hand)
             }

         }

         public func startGame() {
             recruitPlayer()
             makeDeckForGame()
             distributeCard()
         }

     }
