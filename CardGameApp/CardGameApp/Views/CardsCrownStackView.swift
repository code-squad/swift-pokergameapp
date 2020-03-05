//
//  CardsAndCrownStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CardsCrownStackView: UIStackView {

    private let overlappedCardsStackView = OverlappedCardsStackView()
    private let crownImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "crown-iconfinder"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
        setupOverlappedCardsStackView()
        setupCrownImageView()
    }
    
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupOverlappedCardsStackView() {
        addOverlappedCardsStackView()
    }
    
    private func addOverlappedCardsStackView() {
        addArrangedSubview(overlappedCardsStackView)
    }
    
    private func setupCrownImageView() {
        addCrownImageView()
        setConstraintCrownImageView()
    }
    
    private func addCrownImageView(){
        addSubview(crownImageView)
    }
    
    private func setConstraintCrownImageView() {
        crownImageView.leadingAnchor.constraint(equalTo:
            overlappedCardsStackView.trailingAnchor, constant: 7).isActive = true
        crownImageView.centerYAnchor.constraint(equalTo:
            overlappedCardsStackView.centerYAnchor).isActive = true
    }
    
    func updateView(participant: Participant) {
        overlappedCardsStackView.updateView(participant: participant)
        hideCrownImageView()
    }
    private func hideCrownImageView() {
        crownImageView.isHidden = true
    }
    
    func updateCrownViewIsNotHidden() {
        crownImageView.isHidden = false
    }
}
