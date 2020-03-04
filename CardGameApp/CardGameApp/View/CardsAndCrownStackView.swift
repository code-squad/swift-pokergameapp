//
//  CardsAndCrownStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CardsAndCrownStackView: UIStackView {

    private let overlappedCardsStackView = OverlappedCardsStackView()
    private let crownImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "crown-iconfinder"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupStack()
        addOverlappedCardsStackView()
        addAndSetConstraintForCrownImageView()
    }
    
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addOverlappedCardsStackView() {
        addArrangedSubview(overlappedCardsStackView)
    }
    
    private func addAndSetConstraintForCrownImageView() {
        addSubview(crownImageView)
        setConstraintCrownImageView()
    }
    
    private func setConstraintCrownImageView() {
        crownImageView.leadingAnchor.constraint(equalTo: overlappedCardsStackView.trailingAnchor, constant: 7).isActive = true
        crownImageView.topAnchor.constraint(equalTo: overlappedCardsStackView.topAnchor, constant: 5).isActive = true
        crownImageView.bottomAnchor.constraint(equalTo: overlappedCardsStackView.bottomAnchor, constant: -5).isActive = true
    }
    
    func updateView(participant: Participant) {
        overlappedCardsStackView.updateView(participant: participant)
        if participant.isWinner {
            crownImageView.isHidden = false
        } else {
            crownImageView.isHidden = true
        }
    }
    
}
