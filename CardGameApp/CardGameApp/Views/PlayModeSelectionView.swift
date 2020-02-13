//
//  PlayModeSelectionView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct PlayModeSelectionViewDescription {
    let rule: [String]
    let numberOfPlayers: [String]
}

class PlayModeSelectionView: UIView {
    private var contents: PlayModeSelectionViewDescription?
    
    private lazy var selectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
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
    
    required init(with contents: PlayModeSelectionViewDescription) {
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
        }
    }
}
