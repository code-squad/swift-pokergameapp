//
//  Player.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/19.
//

import Foundation

class Player: CardDeck {
    func getCard(newCard: Card) {
        cards.append(newCard)
    }
}
