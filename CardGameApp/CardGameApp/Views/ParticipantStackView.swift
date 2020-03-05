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
    
    private let cardsCrownStackView = CardsCrownStackView()
    
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
        setupLabel()
        setupCardsCrownStackView()
        addCardsCrownStackView()
    }
    
    private func setupProperties() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLabel() {
        addLabel()
    }
    
    private func addLabel() {
        addArrangedSubview(participantLabel)
    }
    
    private func setupCardsCrownStackView() {
        addCardsCrownStackView()
    }
    
    private func addCardsCrownStackView() {
        addArrangedSubview(cardsCrownStackView)
    }
    
    func updateView(name: String, participant: Participant) {
        updateName(with: name)
        updateCardsStackView(participant: participant)
    }
    
    private func updateName(with name: String) {
        participantLabel.text = name
    }
    
    private func updateCardsStackView(participant: Participant) {
        cardsCrownStackView.updateView(participant: participant)
    }
    
    func updateWinnerView(participant: Participant) {
        cardsCrownStackView.updateCrownViewIsNotHidden()
    }
}
