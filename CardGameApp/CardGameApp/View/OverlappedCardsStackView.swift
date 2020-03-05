//
//  CardsStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class OverlappedCardsStackView: UIStackView {
    
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
        addCardsImageViewForDefault()
    }
    
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = -15
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addCardsImageViewForDefault() {
        GameStut.seven.forEach {
            addArrangedSubview(generateCardImageViewDefault())
        }
    }
    
    private func generateCardImageViewDefault() -> UIImageView {
        let cardImageView = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.heightAnchor.constraint(
            equalTo: cardImageView.widthAnchor,
            multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    func updateView(participant: Participant) {
        setAllCardsViewsNotHidden()
        updateApplicatedCardsView(participant: participant)
        setNotApplicatedCardsViewHidden(cardsCount: participant.cardsCount)
    }
    
    private func setAllCardsViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func updateApplicatedCardsView(participant: Participant) {
        var cardsIndex = 0
        participant.searchCard { (card) in
            guard let cardImage = UIImage(named:"\(card.description)") else {
                return
            }
            
            updateApplicatedCardView(at: cardsIndex, cardImage: cardImage)
            cardsIndex += 1
        }
    }
    
    private func updateApplicatedCardView(at index: Int, cardImage: UIImage) {
        guard index < arrangedSubviews.count else {
            return
        }
        
        let imageView = arrangedSubviews[index] as! UIImageView
        imageView.image = cardImage
    }
    
    private func setNotApplicatedCardsViewHidden(cardsCount: Int) {
        for index in cardsCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
    
}
