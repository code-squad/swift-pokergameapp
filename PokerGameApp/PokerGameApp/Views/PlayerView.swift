//
//  PlayerView.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/18.
//

import UIKit

class PlayerView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 2
    }
}
