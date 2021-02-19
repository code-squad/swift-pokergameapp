//
//  Participant.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

protocol Playable {
    func receive(card: Card)
    func cardInfo() -> Array<Card>
}
