//
//  Hand.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import UIKit

struct Hand {
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func makeCardImage() -> [UIImageView] {
        var cardImages: [UIImageView] = []
        
        cards.forEach { card in
            let cardImage = CardImage.image(card.description)
            cardImages.append(cardImage)
        }
    
        return cardImages
    }
}
