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
    
    func updateView(participant: Participant) {
        overlappedCardsStackView.updateView(participant: participant)
    }
}
