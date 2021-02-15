//
//  Hand.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//


import UIKit

class Hand: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .center
        self.spacing = 5
        setHand()
    }
    
    private func setHand() {
        for _ in 0..<7 {
            self.addArrangedSubview(Card().cardBack)
        }
    }
    
    func setConstraint(superView: UIView) {
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 50).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 10).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -10).isActive = true
    }
}
 
