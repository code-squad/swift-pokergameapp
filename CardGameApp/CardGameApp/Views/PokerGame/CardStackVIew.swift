//
//  CardStackVIew.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class CardStackView: UIStackView {
    private var player: Player?
    
    init(of player: Player) {
        self.player = player
        super.init(frame: .zero)
        commonInit()
        setupCards()
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
    
    private func setupCards() {
        player?.forEachCard({ (card) in
            addArrangedSubview(CardImageView(named: String(describing: card)))
        })
    }
}
