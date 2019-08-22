//
//  Playable.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

protocol Playable {
    func sortOwnHand()
    func receiveCard(_ card: Card)
    func receivePrintFormat(_ format: (_ name: String, _ hand: Hand ) -> Void )
    func resetHand()
    var score : Int {get}
}
