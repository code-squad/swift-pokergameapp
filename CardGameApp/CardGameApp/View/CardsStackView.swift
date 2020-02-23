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
        fatalError("init(coder:) has not been implemented")
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
        var maxNum = 0
        PokerGame.GameStut.seven.forEach {
            maxNum += 1
        }
        
        for _ in 0 ..< maxNum {
            addArrangedSubview(generateCardImageView())
        }
    }
    
    private func generateCardImageView() -> UIImageView {
        let cardImageView = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.heightAnchor.constraint(
            equalTo: cardImageView.widthAnchor,
            multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    func updateView(gameStut: PokerGame.GameStut) {
        setAllCardsViewsNotHidden()
        setNotCardsViewHidden(gameStut: gameStut)
    }
    
    private func setAllCardsViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func setNotCardsViewHidden(gameStut: PokerGame.GameStut) {
        var stutCount = 0
        gameStut.forEach {
            stutCount += 1
        }
        
        for index in stutCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
}
