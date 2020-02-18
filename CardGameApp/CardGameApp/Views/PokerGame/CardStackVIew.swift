//
//  CardStackVIew.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class CardStackView: UIStackView {
    private(set) var hand: Hand!
    
    init(with hand: Hand) {
        self.hand = hand
        super.init(frame: .zero)
        commonInit()
        setupCards()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupCards()
    }
    
    private func commonInit() {
        spacing = -8
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func appendCard(_ card: Card) {
        addArrangedSubview(CardImageView(named: String(describing: card)))
    }
    
    func setupCards() {
        arrangedSubviews.forEach{ $0.removeFromSuperview() }
        hand.forEachCard { (card) in
            addArrangedSubview(CardImageView(named: String(describing: card)))
        }
    }
}
