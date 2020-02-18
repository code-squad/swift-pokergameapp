//
//  ParticipantView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ParticipantView: UIView {
    
    private lazy var participantStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var participantLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private lazy var overlappedCardsView: OverlappedCardsView = {
        let view = OverlappedCardsView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func updateView(name: String, participant: Participant) {
        participantLabel.text = name
        overlappedCardsView.updateView(with: participant)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(participantStackView)
        participantStackView.fillSuperView()
        participantStackView.addArrangedSubview(participantLabel)
        participantStackView.addArrangedSubview(overlappedCardsView)
    }
}
