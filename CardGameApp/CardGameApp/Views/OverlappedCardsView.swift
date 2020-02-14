//
//  OverlappedCardsView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct OverlappedCardsViewContents {
    let cards: [String]
}

class OverlappedCardsView: UIView {
    private var maxCards: Int?
    var contents: OverlappedCardsViewContents? {
        didSet {
            updateView()
        }
    }
    
    private lazy var overlappedCardsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -15
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    required init(maxCards: Int?) {
        super.init(frame: .zero)
        self.maxCards = maxCards
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlappedCardsStackView)
        overlappedCardsStackView.fillSuperView()
        guard let max = maxCards else { return }
        (0..<max).forEach { _ in
            let cardView = UIImageView(image: nil)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
            overlappedCardsStackView.addArrangedSubview(cardView)
        }
    }
    
    private func showCardView(by number: Int) {
        let subViewCount = overlappedCardsStackView.arrangedSubviews.count
        guard number > 0, number <= subViewCount else { return }
        (0..<number).forEach {
            overlappedCardsStackView.arrangedSubviews[$0].isHidden = false
        }
        (number..<subViewCount).forEach {
            overlappedCardsStackView.arrangedSubviews[$0].isHidden = true
        }
    }
    
    private func updateView() {
        guard let cards = contents?.cards else { return }
        showCardView(by: cards.count)
        
        cards.enumerated().forEach { (index, card) in
            guard let view = overlappedCardsStackView.arrangedSubviews[index] as? UIImageView else { return }
            view.image = UIImage(named: card)
        }
    }
}
