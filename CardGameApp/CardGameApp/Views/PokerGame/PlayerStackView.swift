//
//  PlayerStackView.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayerStackView: UIStackView {
    let player: Player
    let nameLabel = UILabel()
    lazy var cardStackView = CardStackView(with: player.hand)
    
    init(player: Player) {
        self.player = player
        super.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        self.player = Player()
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        self.player = Player()
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        axis = .vertical
        spacing = 4
        translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textColor = .white
        nameLabel.text = player.name
        addArrangedSubview(nameLabel)
        addArrangedSubview(cardStackView)
    }
}
