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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 5
        
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraintOfView(related superView : UIView, related numbersOfPlayersSegmentControl: UISegmentedControl ) {
        self.topAnchor.constraint(equalTo: numbersOfPlayersSegmentControl.bottomAnchor, constant: 10).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 30).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -30).isActive = true
    }
}

class CardsStackView: UIStackView {
    
    override init(frame: CGRect) { // by code
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = -15
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ParticipantStackView : UIStackView {
    
    override init(frame: CGRect) { // by code
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .equalSpacing
        self.alignment = .fill
        self.spacing = 15
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


