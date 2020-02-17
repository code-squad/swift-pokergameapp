//
//  GamePlayView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct GamePlayViewContents {
    let cards: [[String]]
}

class GamePlayView: UIView {
    private var maxParticipants: Int?
    var contents: GamePlayViewContents? {
        didSet {
            updateView()
        }
    }
    
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(participantsStackView)
        participantsStackView.fillSuperView()
        guard let max = maxParticipants else { return }
        (0..<max).forEach { _ in
            let participantView = ParticipantView(maxCards: Descriptions.maxCards)
            participantsStackView.addArrangedSubview(participantView)
        }
    }
    
    private func showParticipantView(by number: Int) {
        let subViewCount = participantsStackView.arrangedSubviews.count
        guard number > 0, number <= subViewCount else { return }
        (0..<number).forEach {
            participantsStackView.arrangedSubviews[$0].isHidden = false
        }
        (number..<subViewCount).forEach {
            participantsStackView.arrangedSubviews[$0].isHidden = true
        }
    }
    
    private func createParticipantNames(by number: Int) -> [String] {
        var names = (1..<number).map { "\(Descriptions.playerLabel)\($0)" }
        names.append("\(Descriptions.dealerLabel)")
        return names
    }
    
    private func updateView() {
        guard let contents = contents else { return }
        showParticipantView(by: contents.cards.count)
        let names = createParticipantNames(by: contents.cards.count)
        
        (0..<contents.cards.count).forEach {
            guard let view = participantsStackView.arrangedSubviews[$0] as? ParticipantView else { return }
            view.contents = ParticipantViewContents(
                name: names[$0],
                cards: contents.cards[$0])
        }
    }
}
