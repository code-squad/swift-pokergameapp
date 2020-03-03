//
//  StackView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class GameTableStackView: UIStackView {
    
    private var game: Playable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(frame: CGRect, game: Playable) {
        super.init(frame: frame)
        self.game = game
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
        subviews.forEach {
         removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    private func configuerStackView() {
        snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        distribution = .fillEqually
        axis = .vertical
    }
    
    private func initCardStackView()  {
        game?.pushPlayerToView { addArrangedSubview(initPlayerStackView($0)) }
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
    
    private func initWinnerImage(player: Player) -> UIImageView {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(imageView.snp.width).multipliedBy(1.27)
        }
        guard let winnerImageName = player.winnerImageName else { return imageView }
        imageView.image = UIImage(named: winnerImageName)
        return imageView
    }
    
    private func initPlayerStackView(_ player: Player) -> UIStackView {
        let playerStack = UIStackView()
        let cardStack = UIStackView()
        let identifierLabel = UILabel()
        identifierLabel.text = player.description
        identifierLabel.textColor = .white
        player.forEach { initCardsStackVieew(cardStack, card: $0) }
        cardStack.addArrangedSubview(initWinnerImage(player: player))
        playerStack.addArrangedSubview(identifierLabel)
        playerStack.addArrangedSubview(cardStack)
        playerStack.axis = .vertical
        return playerStack
    }
}
