//
//  PlayModeSelectionView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

protocol PlayModeSelectionViewDelegate: class {
    func didModeChanged(to mode: PlayMode)
}

struct PlayModeSelectionViewContents {
    let rule: [String]
    let numberOfPlayers: [String]
}

struct PlayMode {
    enum Rule: Int {
        case sevenCardStud = 0
        case fiveCardStud
    }
    
    enum Number: Int {
        case two = 0
        case three, four
    }
    
    let rule: Rule
    let number: Number
}

class PlayModeSelectionView: UIView {
    weak var delegate: PlayModeSelectionViewDelegate?
    
    private var contents: PlayModeSelectionViewContents?
    
    private lazy var selectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var ruleSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: self.contents?.rule)
        return control
    }()
    
    private lazy var playersSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: self.contents?.numberOfPlayers)
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    required init(with contents: PlayModeSelectionViewContents) {
        super.init(frame: .zero)
        self.contents = contents
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(selectionStackView)
        selectionStackView.fillSuperView()
        selectionStackView.addArrangedSubview(ruleSegmentedControl)
        selectionStackView.addArrangedSubview(playersSegmentedControl)
        selectionStackView.arrangedSubviews.forEach {
            guard let segmentedControl = $0 as? UISegmentedControl else { return }
            segmentedControl.selectedSegmentIndex = .zero
            segmentedControl.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.white],
                for: .normal)
            segmentedControl.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black],
                for: .selected)
            segmentedControl.addTarget(self, action: #selector(notifyPlayModeDidChange), for: .valueChanged)
        }
    }
    
    @objc func notifyPlayModeDidChange() {
        if let rule = PlayMode.Rule(rawValue: ruleSegmentedControl.selectedSegmentIndex),
            let number = PlayMode.Number(rawValue: playersSegmentedControl.selectedSegmentIndex) {
                delegate?.didModeChanged(to: PlayMode(rule: rule, number: number))
        }
    }
    
    func invokeByMode(block: (PlayMode) -> ()) {
        if let rule = PlayMode.Rule(rawValue: ruleSegmentedControl.selectedSegmentIndex),
        let number = PlayMode.Number(rawValue: playersSegmentedControl.selectedSegmentIndex) {
            block(PlayMode(rule: rule, number: number))
        }
    }
}
