//
//  Number.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//enum을 만들고 스위프트에게 allCases 배열을 자동으로 만들어달라고 하는 구조
// A가 1 일수도 있고, 아닐수도 있다. A는 Ace다.
enum Number: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
    
    var value: String {
        switch self {
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        default:
            return "\(self.rawValue)"
        }
    }
}

