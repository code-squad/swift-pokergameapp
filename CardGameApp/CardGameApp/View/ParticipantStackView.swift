//
//  ParticipantStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ParticipantStackView: UIStackView {

    private let participantLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupStack()
        setupView()
    }
    
    private func setupStack() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
        addArrangedSubview(participantLabel)
        addArrangedSubview(CardsStackView())
    }
    
    func updateView(name: String, player: Player) {
        participantLabel.text = name
        
        let cardStackIndex = 1
        let cardsStackView = arrangedSubviews[cardStackIndex] as! CardsStackView
        cardsStackView.updateView(player: player)
    }
}
