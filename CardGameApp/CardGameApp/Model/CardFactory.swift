//
//  CardFactory.swift
//  CardGame
//
//  Created by Elena on 24/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardFactory {
    // 숫자와 모양을 랜덤으로 생성해주는 함수
    static func createRandomCard() -> Card {
        let number = Number.allCases.randomElement() ?? .ace
        let shape = Shape.allCases.randomElement() ?? .spades
        return Card(number: number, shape: shape)
    }
    // 역할 : 메뉴선택에 따라 출력결과를 다르게 반환, 카드덱의 상태를 만들어서 반환
    // 매개변수 : Menu , cardDeck , 반환형 : String
    static func makeCardStatus(_ menu: Menu,_ cardDeck: CardDeck) -> (String,CardDeck) {
        var cards = cardDeck
        switch menu {
        case .reset:
            cards.reset()
            return ("카드 전체를 초기화했습니다.\n총 \(cards.count())장의 카드가 남아있습니다. \n",cards)
        case .shuffle:
            cards.shuffle()
            return ("전체 \(cards.count())장의 카드를 섞었습니다. \n",cards)
        case .pullOut:
            let card = cards.removeOne()
            return ("\(card)\n총 \(cards.count())장의 카드가 남아있습니다. \n",cards)
        case .quit:
            return ("종료",cards)
        }
    }
}
