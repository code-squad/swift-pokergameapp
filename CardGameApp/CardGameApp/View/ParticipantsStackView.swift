//
//  ParticipantsStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ParticipantsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setup()
        setupView()
    }
    
    private func setup() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 40
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
        let dealerCount = 1
        var maxNum = 0
        Players.Number.four.forEach {
            maxNum += 1
        }
        maxNum += dealerCount
        
        for _ in 0 ..< maxNum {
            addArrangedSubview(ParticipantStackView())
        }
    }
}
