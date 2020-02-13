//
//  OverlappedCardsView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct OverlappedCardsViewDescription {
    let cards: [String]
}

class OverlappedCardsView: UIView {
    private var contents: OverlappedCardsViewDescription?
    
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
    
    required init(with contents: OverlappedCardsViewDescription?) {
        super.init(frame: .zero)
        self.contents = contents
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlappedCardsStackView)
        overlappedCardsStackView.fillSuperView()
        contents?.cards.forEach {
            let cardView = UIImageView(image: UIImage(named: $0))
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
            overlappedCardsStackView.addArrangedSubview(cardView)
        }
    }
}
