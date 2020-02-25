//
//  GameStut.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum GameStut: Int, CaseIterable {
     case seven = 7, five = 5
     
     func forEach(handler: () -> (Void)) {
         for _ in 0 ..< self.rawValue {
             handler()
         }
     }
 }

extension GameStut: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}
