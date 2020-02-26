//
//  Enum.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/17.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation



extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
