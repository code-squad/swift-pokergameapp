//
//  GameMode.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/17.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameMode {
    private let entry: Entry
    private let studType: StudType
    
    init(entry: Entry, studType: StudType) {
        self.entry = entry
        self.studType = studType
    }
    
    enum StudType: Int, CustomStringConvertible {
        case fiveStud = 5
        case sevenStud = 7
        
        var description: String {
            return "\(self.rawValue)"
        }
        
    }
    
    enum Entry: Int, CustomStringConvertible {
        case two = 2
        case three = 3
        case four = 4
        
        var description: String {
            return "\(self.rawValue)"
        }
    }

}
