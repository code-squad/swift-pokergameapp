//
//  DrawCardError.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum DrawCardErrors: Error, CustomStringConvertible {
    case noMoreCardInDeck
    case notEnoughCardInDeck
    
    var description: String {
        switch self {
        case .noMoreCardInDeck:
            return "카드 덱에 카드가 더이상 없습니다."
        case .notEnoughCardInDeck:
            return "플레이어에게 배급할 카드가 모자랍니다. \n게임을 종료합니다."
        }
    }
}
