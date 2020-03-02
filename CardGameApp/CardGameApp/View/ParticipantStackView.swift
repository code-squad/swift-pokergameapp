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
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupProperties()
        addArrangedViews()
    }
    
    private func setupProperties() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addArrangedViews() {
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
        guard Controller.verifyIndex(index: cardStackIndex, arrLen: arrangedSubviews.count) else {
            return
        }
        
        let cardsStackView = arrangedSubviews[cardStackIndex] as! CardsStackView
        cardsStackView.updateView(participant: participant)
    }
    
}
