//
//  SizeInfoStructs.swift
//  PokergameApp
//
//  Created by hw on 26/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

struct CardGameSizeInfo {
    var cardSize = 7
    var playerSize = 4
    let ratio: CGFloat = 1.27
    let bufferSize: CGFloat = 10
}

struct StackViewSizeInfo {
    let widthProportion: CGFloat = 0.1
    let marginSpace: CGFloat = 0
    var width: CGFloat = 0
    var leftAlign: CGFloat = -20
    var rightAlign: CGFloat = 20
    var spacingSize: CGFloat = -10
}
