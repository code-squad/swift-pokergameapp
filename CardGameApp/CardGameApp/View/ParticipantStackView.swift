//
//  ParticipantStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ParticipantStackView: UIStackView {

    private let participantLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
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
    
    func updateView(name: String, participant: Participant) {
        updateName(with: name)
        updateCardsStackView(participant: participant)
    }
    
    private func updateName(with name: String) {
        participantLabel.text = name
    }
    
    private func updateCardsStackView(participant: Participant) {
        let cardStackIndex = 1
        let cardsStackView = arrangedSubviews[cardStackIndex] as! CardsStackView
        cardsStackView.updateView(participant: participant)
    }
    
}
