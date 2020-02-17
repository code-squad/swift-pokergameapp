//
//  Enum.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/17.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

enum Style {
    case five
    case seven
    
    func forEach(handler: () -> Void) {
        switch self {
        case .five:
            (1...5).forEach { _ in
                handler()
            }
        case .seven:
            (1...7).forEach { _ in
                handler()
            }
        }
    }
}
