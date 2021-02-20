//
//  Hand.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//


import UIKit

class HandView: UIStackView {
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
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .center
        self.spacing = -15
    }
}
 
