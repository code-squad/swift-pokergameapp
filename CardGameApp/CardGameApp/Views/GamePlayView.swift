//
//  GamePlayView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct GamePlayViewContents {
    let playerNames: [String]
    let cards: [[String]]
}

class GamePlayView: UIView {
    private var maxParticipants: Int?
    private var contents: GamePlayViewContents?
    
    private lazy var participantsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 30
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
    
    required init(maxParticipantNumber: Int) {
        super.init(frame: .zero)
        self.maxParticipants = maxParticipantNumber
        setupView()
    }
    
    private func setupView() {
        addSubview(participantsStackView)
        participantsStackView.fillSuperView()
        guard let max = maxParticipants else { return }
        (0..<max).forEach { _ in
            let participantView = ParticipantView(maxCards: Descriptions.shared.maxCards)
            participantsStackView.addArrangedSubview(participantView)
        }
    }
}
