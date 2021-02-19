//
//  Protocol.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/17.
//

import Foundation


protocol Playable {
    func receiveCard(card : Card)
    func resetCards()
    func showCards(closure: (PlayerCard) -> Void)
}
