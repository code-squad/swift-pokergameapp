//
//  Menu.swift
//  CardGame
//
//  Created by Elena on 27/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 메뉴선택 : 가독성과 편리성을 위해 선택 (새롭게 알게되서 사용)
enum Menu: Int, CaseIterable {
    case reset = 1, shuffle, pullOut, quit
    
    var menuPrint: String{
        switch self {
        case .reset:
            return "카드 초기화"
        case .shuffle:
            return "카드 섞기"
        case .pullOut:
            return "카드 하나 뽑기"
        case .quit:
            return "종료"
        }
    }
}

struct MenuBox {
    // 역할 : 입력받은것이 메뉴인지 확인하는 함수
    // 매개변수 : String , 반환형 : Menu
    static func getMenu(_ menuStringNumber: String) -> Menu? {
        guard let menuNumber = Int(menuStringNumber) else {
            return nil
        }
        guard let menuSelected = Menu(rawValue: menuNumber) else {
            return nil
        }
        return menuSelected
    }
    
}
