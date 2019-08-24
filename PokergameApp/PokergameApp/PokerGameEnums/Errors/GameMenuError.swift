//
//  GameMenuError.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum GameMenuError: Error, CustomStringConvertible {
    case outOfRangeMenu
    case selectedGamePlayersAbsence
    case selectedGameTypeAbsence
    case systemError
    
    var description: String {
        switch self{
        case .selectedGamePlayersAbsence:
            return "게임 플레이 인원수가 미정입니다."
        case .outOfRangeMenu:
            return "입력값이 메뉴 선택범위 밖입니다."
        case .selectedGameTypeAbsence:
            return "카드게임 유형이 미정입니다."
        case .systemError:
            return "게임 결과 오류!!"
        }
    }
}
