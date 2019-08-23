//
//  GameMenuError.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum GameMenuError: Error, CustomStringConvertible {
    case notANumber
    case outOfRangeMenu
    case outOfRangePlayer
    
    var description: String {
        switch self{
        case .notANumber:
            return "입력값이 숫자가 아닙니다."
        case .outOfRangeMenu:
            return "입력값이 메뉴 선택범위 밖입니다."
        case .outOfRangePlayer:
            return "입력값이 게임 참여 인원을 초과했습니다.\n1~4명을 입력하세요."
        }
    }
}
