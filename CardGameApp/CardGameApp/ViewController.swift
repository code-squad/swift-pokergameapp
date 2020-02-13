//
//  ViewController.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/05.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numberOfUpturnedCards = 7
    
    lazy var cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        (0..<numberOfUpturnedCards).forEach { _ in
            let upturnedCardImageView = UIImageView(image: UIImage(named: "card-back")!)
            stackView.addArrangedSubview(upturnedCardImageView)
        }
        return stackView
    }()
    
    private lazy var selectionView: PlayModeSelectionView = {
        let rule = [RuleDescription.seven, RuleDescription.five]
        let number = [NumberDescription.two, NumberDescription.three, NumberDescription.four]
        let selection = PlayModeSelectionViewDescription(rule: rule, numberOfPlayers: number)
        let view = PlayModeSelectionView(with: selection)
        return view
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundPattern()
        
        view.addSubview(selectionView)
        layoutSelectionView()
    }
    
    private func setBackgroundPattern() {
        if let backgroundPatternImage = UIImage(named: "bg_pattern") {
            view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        }
    }
    
    private func layoutSelectionView() {
        let safeArea = view.safeAreaLayoutGuide
        selectionView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        selectionView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
    
    private func layoutUpturnedCards() {
        let safeArea = view.safeAreaLayoutGuide
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        cardStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        cardStackView.arrangedSubviews.forEach { card in
            card.translatesAutoresizingMaskIntoConstraints = false
            card.heightAnchor
                .constraint(equalTo: card.widthAnchor, multiplier: 1.27)
                .isActive = true
        }
    }
}
