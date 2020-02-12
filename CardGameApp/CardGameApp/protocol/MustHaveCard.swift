//
//  MustHaveCard.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/12.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

protocol MustHaveCard{
    var ownCardDeck:[Card]{get}
    
    func receiveCard(card : Card)
}
