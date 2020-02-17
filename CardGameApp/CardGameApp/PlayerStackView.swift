//
//  PlayerStackView.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/17.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class PlayerStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(playerName: String) {
        self.init()
        addPlayerLabel(playerName: playerName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.axis = .vertical
    }
    
    private func addPlayerLabel(playerName: String) {
        let playerLabel: UILabel = {
            let label = UILabel()
            label.text = playerName
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.addArrangedSubview(playerLabel)
    }
}
