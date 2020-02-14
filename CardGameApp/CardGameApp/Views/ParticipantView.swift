//
//  ParticipantView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct ParticipantViewContents {
    let name: String
    let cards: [String]
}

class ParticipantView: UIView {
    private var maxCards: Int?
    var contents: ParticipantViewContents? {
        didSet {
            updateView()
        }
    }
    
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
        let view = OverlappedCardsView(maxCards: maxCards)
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
    
    required init(maxCards: Int) {
        super.init(frame: .zero)
        self.maxCards = maxCards
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(participantStackView)
        participantStackView.fillSuperView()
        participantStackView.addArrangedSubview(participantLabel)
        participantStackView.addArrangedSubview(overlappedCardsView)
    }
    
    private func updateView() {
        participantLabel.text = contents?.name
        if let cards = contents?.cards {
            overlappedCardsView.contents = OverlappedCardsViewContents(cards: cards)
        }
    }
}
