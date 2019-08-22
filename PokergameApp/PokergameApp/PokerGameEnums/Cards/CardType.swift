//
//  CardType.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

/// 각각의 DataType을 enum으로 구성합니다.
/// 둘은 서로의 상하관계가 존재하지 않으므로 별도의 enum으로 분류하였습니다.
/// 각각의 문양 유니코드도 찾아보았지만 터미널을 다채롭게 하기 위해 특수문자로 대체해보았습니다.
enum CardType: String, CustomStringConvertible, CaseIterable{
    case spade
    case heart
    case diamond
    case clover
    
    var description: String{
        switch self{
        case .spade:
            return "♠️"     //"\u{2663}"
        case .heart:
            return "♥️"     //"\u{2764}"
        case .diamond:
            return "🔶"     //"\u{2666}"
        case .clover:
            return "☘"     //"\u{2618}"
        }
    }
}
