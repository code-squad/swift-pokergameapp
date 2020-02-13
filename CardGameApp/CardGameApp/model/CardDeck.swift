//
//  CardDeck.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/13.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

/*
 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
 count 갖고 있는 카드 개수를 반환한다.
 shuffle 기능은 전체 카드를 랜덤하게 섞는다.
 removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
 reset 처음처럼 모든 카드를 다시 채워넣는다.
 메소드 매개변수와 리턴값은 어떤 타입이 좋을지, 속성으로 무엇이 필요한지, (let)불변 Immutable 인지 (var)가변 mutable 인지 판단해야 한다.
 */


struct CardDeck {
    //카드덱
    private var deck = [Card]()
    
    //카드 52개를 카드덱에 초기화 해줘야함.
    //여기서 CaseIterable을 써서 모든 case를 가져와서 조합
    //그다음 덱에 똑같은 카드가 있는지 비교해 줘야 하나? 어차피 이중 for문 돌려서 하면?
    init() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
}
