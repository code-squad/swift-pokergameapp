//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Dealer {
    
    var deck: Deck = {
        var deck: Deck = Deck()
        deck.shuffle()
        return deck
    }()
    var game: Game
    var cards: [Card] = []
    
    init(game: Game) {
        self.game = game
        divideCards()
        divideDealerCards()
    }
    
    func divideCards() {
        game.attendies.forEach { gamer in
            while game.style.description != gamer.cards.count {
                guard let card = deck.removeOne() else { return }
                gamer.cards.append(card)
            }
        }
    }
    
    func divideDealerCards() {
        while game.style.description != cards.count {
            guard let card = deck.removeOne() else { return }
            cards.append(card)
        }
    }
}

