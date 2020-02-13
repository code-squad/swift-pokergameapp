//
//  ParticipantView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct ParticipantViewDescription {
    let name: String
    let cards: OverlappedCardsViewDescription
}

class ParticipantView: UIView {
    private var contents: ParticipantViewDescription?
    
    private lazy var participantStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var participantLabel: UILabel = {
        let label = UILabel()
        label.text = contents?.name
        label.textColor = .white
        return label
    }()
    
    private lazy var overlappedCardsView: OverlappedCardsView = {
        let view = OverlappedCardsView(with: contents?.cards)
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    required init(with contents: ParticipantViewDescription) {
        super.init(frame: .zero)
        self.contents = contents
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(participantStackView)
        participantStackView.fillSuperView()
        participantStackView.addArrangedSubview(participantLabel)
        participantStackView.addArrangedSubview(overlappedCardsView)
    }
}
