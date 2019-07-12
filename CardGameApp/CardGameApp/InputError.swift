//
//  InputError.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum InputError: String, Error {
    case notExistsMenu = "해당 번호의 메뉴는 존재하지 않습니다."
    case notSupportUserCount = "참석인원은 1명부터 4명까지 가능합니다."
}
