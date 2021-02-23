//
//  CardView.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/22.
//

import UIKit

class CardView: UIImageView {
    
    private let card: Card
    
    init(of card: Card) {
        self.card = card
        super.init(frame: .zero)
        
        let cardImage = CardImage(of: card)
        self.image = UIImage(named: cardImage.fileName)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.27).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
