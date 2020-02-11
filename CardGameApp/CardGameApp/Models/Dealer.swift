//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Dealer {
    private let gameType: GameType
    private var deck = CardDeck()
    private var _communityCards: [Card] = []
    
    var communityCards: [Card] {
        _communityCards
    }
    
    init(game gameType: GameType) {
        self.gameType = gameType
        setupDeck()
        setupCommunityCards()
    }
    
    func setupDeck() {
        deck.shuffle()
    }
    
    func setupCommunityCards() {
        guard let hands = drawHands() else { return }
        _communityCards = hands
    }
    
    func drawHands() -> [Card]? {
        var hands: [Card] = []
        
        for _ in 0..<gameType.numberOfHands() {
            guard let card = deck.removeOne() else { return nil }
            hands.append(card)
        }
        
        return hands
    }
}

