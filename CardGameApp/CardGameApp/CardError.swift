//
//  CardError.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardError: Error {
    case notExistCard
    
    var localizedDescription: String {
        switch self {
        case .notExistCard:
            return "더 이상 카드가 없습니다!"
        }
    }
}
