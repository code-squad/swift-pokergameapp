//
//  ANSI_C_RandomGenerator.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/13.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
struct ANSI_C_RandomNumberGenerator: RandomNumberGenerator {
    var seed = 123456789
    let m = 2 << 30
    let a = 1103515245
    let c = 12345
    
    mutating func next<T>() -> T where T: FixedWidthInteger, T: UnsignedInteger {
        seed = (a * seed + c) % m
        return T(seed)
    }
}
