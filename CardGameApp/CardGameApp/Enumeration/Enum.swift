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
    
    func isEqual(_ compare: Int) -> Bool {
        (self.rawValue - compare) > 0 ? true : false
    }
}

enum Peoples: Int, CaseIterable {
    case two = 2
    case three = 3
    case four = 4
    
    init(index: Int) {
        self = Peoples.allCases[index]
    }
    
    func forEach(handler: (Int) -> Void) {
        (1...self.rawValue).forEach { handler($0) }
    }
}
