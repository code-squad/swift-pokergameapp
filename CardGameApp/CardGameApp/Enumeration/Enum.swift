//
//  Enum.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/17.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

enum Style: Int {
    case five = 5
    case seven = 7
    
    func forEach(handler: () -> Void) {
        (1...self.rawValue).forEach { _ in
            handler()
        }
    }
}
