//
//  CardNumber.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
/// 각각의 DataType을 enum으로 구성합니다.
/// 둘은 서로의 상하관계가 존재하지 않으므로 별도의 enum으로 분류하였습니다.
enum CardNumber: Int, CustomStringConvertible, CaseIterable{
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            return "\(self.rawValue)"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}
