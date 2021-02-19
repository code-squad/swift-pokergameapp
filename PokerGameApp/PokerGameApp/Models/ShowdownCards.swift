//
//  ShowdownCards.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/19.
//

import UIKit

struct ShowdownCards {
    
    private let owner: Player
    private let setOfCards: [Card]
    
    init(owner: Player, setOfCards: [Card]) {
        self.owner = owner
        self.setOfCards = setOfCards
    }
    
    func getOwnerName() -> String {
        return owner.tellName()
    }
    
    private func makeCardView(from card: Card) -> UIImageView {
        let cardImage = UIImage(named: "\(card.suit)\(card.rank)")
        let cardView = UIImageView(image: cardImage)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive  = true
        return cardView
    }
}
