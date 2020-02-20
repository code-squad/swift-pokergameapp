//
//  CardStackVIew.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class CardStackView: UIStackView {
    private var hand: Hand!
    
    init(with hand: Hand) {
        self.hand = hand
        super.init(frame: .zero)
        configure()
        setupCards()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        spacing = -8
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupCards() {
        arrangedSubviews.forEach{ $0.removeFromSuperview() }
        hand.forEachCard { (card) in
            addArrangedSubview(CardImageView(named: String(describing: card)))
        }
    }
}
