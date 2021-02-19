//
//  Protocol.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/19.
//

import Foundation

protocol Playable {
    func showCards() -> [Card]
    func dropMyCards()
}
