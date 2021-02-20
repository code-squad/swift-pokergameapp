//
//  PokerGameView.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/18.
//

import UIKit

class PokerGameView: UIStackView {
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
        self.spacing = 15
    }
    
    func setConstraint(superView: UIView, segmentedControl: UISegmentedControl) {
        self.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -60).isActive = true
    }
}
