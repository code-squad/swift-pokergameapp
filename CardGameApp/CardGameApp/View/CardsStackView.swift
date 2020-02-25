//
//  CardsStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CardsStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        setupStack()
        setupView()
    }
    
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = -15
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
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
        var cardsIndex = 0
        participant.searchCard { (card) in
            updateSelectedCardView(at: cardsIndex,
                                   cardImage: UIImage(named:"\(card.description)"))
            cardsIndex += 1
        }
        
        let cardsCount = cardsIndex
        setNotCardsViewHidden(cardsCount: cardsCount)
    }
    
    private func setAllCardsViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func updateSelectedCardView(at index: Int, cardImage: UIImage?) {
        let imageView = arrangedSubviews[index] as! UIImageView
        if let image = cardImage {
            imageView.image = image
        }
    }
    
    private func setNotCardsViewHidden(cardsCount: Int) {
        for index in cardsCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
}
