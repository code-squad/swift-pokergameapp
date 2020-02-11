//
//  PokerGameStackView.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/11.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PokerGameStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        axis = .vertical
        spacing = 16
        translatesAutoresizingMaskIntoConstraints = false
        alignment = .top
    }
}

class PlayerStackView: UIStackView {
    private var displayName: String = ""
    let nameLabel = UILabel()
    
    init(displayName: String) {
        self.displayName = displayName
        super.init(frame: .zero)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        axis = .vertical
        spacing = 4
        translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textColor = .white
        nameLabel.text = displayName
        addArrangedSubview(nameLabel)
    }
}

class CardStackView: UIStackView {
    private var player: Playable?
    
    init(of player: Playable) {
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
        player?.hands.map { $0.description }
            .forEach({ (filename) in
                addArrangedSubview(CardImageView(named: filename))
            })
    }
}
