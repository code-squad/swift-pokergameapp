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
    
    func updateView(gameStut: PokerGame.GameStut, playersNum: Players.Number){
        var playersNumCount = 0
        playersNum.forEach {
            playersNumCount += 1
        }
        
        let subviewsCount = arrangedSubviews.count
        for index in 0 ..< subviewsCount {
            arrangedSubviews[index].isHidden = true
        }
        for index in 0 ..< playersNumCount {
            arrangedSubviews[index].isHidden = false
        }
        
        var gameStutCount = 0
        gameStut.forEach {
            gameStutCount += 1
        }
    }
    
    private func configure() {
        setup()
        setupCardsView()
    }
    
    private func setup() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 40
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCardsView() {
        addHorizontalCardsStackViewAndCards()
    }
    
    private func addHorizontalCardsStackViewAndCards() {
        var maxNum = 0
        Players.Number.four.forEach {
            maxNum += 1
        }
        for _ in 0 ..< maxNum {
            addArrangedSubview(
                generateHorizontalCardsStackViewAndCards())
        }
    }
    
    private func generateHorizontalCardsStackViewAndCards() -> UIStackView {
        let horizontalStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = -15
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        addCardViews(to: horizontalStackView)
        return horizontalStackView
    }
    
    private func addCardViews(to cardStackView: UIStackView) {
        var maxNum = 0
        PokerGame.GameStut.seven.forEach {
            maxNum += 1
        }
        
        for _ in 0 ..< maxNum {
            cardStackView.addArrangedSubview(
                generateCardImageView())
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
}
