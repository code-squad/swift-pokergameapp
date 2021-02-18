//
//  TestScenario.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/16.
//

import Foundation

func testScenario() {
    var deck = CardDeck()
    
    print("> 카드초기화")
    deck.reset()
    print("카드 전체를 초기화했습니다.")
    var cardNum = deck.count
    print("총 \(cardNum)장의 카드가 있습니다.\n")
    
    print("> 카드섞기")
    deck.shuffle()
    cardNum = deck.count
    print("전체 \(cardNum)장의 카드를 섞었습니다.\n")
    
    print("> 카드 하나 뽑기")
    var card = deck.removeOn()
    if let card = card {
        cardNum = deck.count
        print(card)
        print("총 \(cardNum)장의 카드가 남아있습니다.\n")
    } else {
        print("남아있는 카드가 없습니다.")
    }

    print("> 카드 하나 뽑기")
    card = deck.removeOn()
    if let card = card {
        cardNum = deck.count
        print(card)
        print("총 \(cardNum)장의 카드가 남아있습니다.\n")
    } else {
        print("남아있는 카드가 없습니다.")
    }
}
func pockerGameScenario() {
    var game = PockerGame(number: ParticipantType.three, number: GameType.five)
    game.gameStart()
    print("5카드 기준, 참가자 3명 일 때\n")
    print(game.getDealer())
    print(game.getParticipants())
    
    game = PockerGame(number: ParticipantType.four, number: GameType.seven)
    game.gameStart()
    print("\n7카드 기준, 참가자 4명 일 때\n")
    print(game.getDealer())
    print(game.getParticipants())
}
