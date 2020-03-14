//
//  StackView.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

class GameStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func setConstraintOfView(related superView : UIView, related numbersOfPlayersSegmentControl: UISegmentedControl ) {
        self.topAnchor.constraint(equalTo: numbersOfPlayersSegmentControl.bottomAnchor, constant: 10).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 30).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 5
    }
}

class CardsStackView: UIStackView {
    
    override init(frame: CGRect) { // by code
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = -15
    }
}

class ParticipantStackView : UIStackView {
    
    override init(frame: CGRect) { // by code
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .equalSpacing
        self.alignment = .fill
        self.spacing = 15
    }
}

class ParticipantSectionStack : UIStackView {
    
    override init(frame: CGRect) { // by code
        super.init(frame: frame)
        
    }
    
    convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.alignment = .center
        self.spacing = 5
    }
}
