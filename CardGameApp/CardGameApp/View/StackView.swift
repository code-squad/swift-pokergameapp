//
//  StackView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class StackView: UIStackView {
    
    private var game: Playable? = Game.fiveCardStud(gamers: Players())
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func fetchGame(game: Playable?) {
        self.game = game
        removeContents()
        initCardStackView()
        layoutIfNeeded()
    }
    
    private func configure() {
        configuerStackView()
        initCardStackView()
    }
    
    private func removeContents() {
        stackView.subviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    private func configuerStackView() {
        stackView = UIStackView()
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
        cardView.image = UIImage(named: card.description)
        cardView.snp.makeConstraints { (make) in
            make.height.equalTo(cardView.snp.width).multipliedBy(1.27)
            stackView.addArrangedSubview(cardView)
        }
    }
    
    private func initPlayerStackView(_ player: Player) -> UIStackView {
        let playerStack = UIStackView()
        let cardStack = UIStackView()
        let identifierLabel = UILabel()
        identifierLabel.text = player.description
        identifierLabel.textColor = .white
        player.forEach { initCardsStackVieew(cardStack, card: $0) }
        playerStack.addArrangedSubview(identifierLabel)
        playerStack.addArrangedSubview(cardStack)
        playerStack.axis = .vertical
        return playerStack
    }
}
