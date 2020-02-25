//
//  StackView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class StackView: UIView {
    
    private var game: Game? = .fiveCardStud(gamers: Players())
    private var stackView: UIStackView
    
    override init(frame: CGRect) {
        stackView = UIStackView()
        super.init(frame: frame)
        configuerStackView()
        initCardStackView()
    }
    
    required init?(coder: NSCoder) {
        stackView = UIStackView()
        super.init(coder: coder)
        configuerStackView()
        initCardStackView()
    }
    
    func fetchGame(game: Game?) {
        self.game = game
        stackView.subviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        initCardStackView()
        layoutIfNeeded()
    }
    
    private func configuerStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
    }
    
    private func initCardStackView()  {
        game?.pushPlayerToView { stackView.addArrangedSubview(initPlayerStackView($0)) }
    }
    
    private func initCardsStackVieew(_ stackView: UIStackView, card: Card) {
        stackView.spacing = -8
        let cardView = UIImageView()
        card.apply(imageView: cardView)
        cardView.snp.makeConstraints { (make) in
            make.height.equalTo(cardView.snp.width).multipliedBy(1.27)
            stackView.addArrangedSubview(cardView)
        }
    }
    
    private func initPlayerStackView(_ player: Player) -> UIStackView {
        let playerStack = UIStackView()
        let cardStack = UIStackView()
        let identifierLabel = UILabel()
        player.applyIdentifier(label: identifierLabel)
        identifierLabel.textColor = .white
        player.forEach { initCardsStackVieew(cardStack, card: $0) }
        playerStack.addArrangedSubview(identifierLabel)
        playerStack.addArrangedSubview(cardStack)
        playerStack.axis = .vertical
        return playerStack
    }
}
