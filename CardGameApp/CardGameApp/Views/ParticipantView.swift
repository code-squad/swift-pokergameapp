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
    private var contents: ParticipantViewContents?
    
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
        if let max = maxCards {
            let view = OverlappedCardsView(maxCards: max)
            participantStackView.addArrangedSubview(view)
        }
    }
}
