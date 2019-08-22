//
//  Card.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
/// 카드 구조체는 카드타입과 카드넘버를 저장 프로퍼티로 지닙니다.
/// 카드 생성시 숫자나 타입의 유효범위를 넘지 않도록 enum Data type으로 지정합니다.
class Card: CustomStringConvertible{
    private (set) var type : CardType
    private (set) var number : CardNumber
    
    init(type: CardType, number: CardNumber){
        self.type = type
        self.number = number
    }
    var description : String {
        get {
            return "\(self.type.description)\(self.number.description)"
        }
    }
}
