//
//  MenuChecker.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuChecker {
    static func checkMenu (_ input: (menu: String, people: String)) throws -> (Menu, UserCount) {
        guard let menu = Menu(rawValue: Int(input.menu) ?? 0) else {
            throw InputError.notExistsMenu
        }
        
        guard let userCount = UserCount(rawValue: Int(input.people) ?? 0) else {
            throw InputError.notSupportUserCount
        }
        
        return (menu, userCount)
    }
}
