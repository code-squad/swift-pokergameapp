//
//  GameView.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class GameView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.axis = .vertical
        self.spacing = 30
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 30).isActive = true
        self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -60).isActive = true
    }
}
