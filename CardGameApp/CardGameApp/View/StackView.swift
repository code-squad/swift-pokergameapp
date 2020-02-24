//
//  StackView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class StackView: UIView {
    
    var game: Game!
    private var stackView: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        setup()
        configuerStackView()
    }
    
    
    init(game: Game) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.game = game
        initPlayersStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchGame(game: Game?) {
        self.game = game
    }
    
    private func setup() {
        var players = Players()
        players.addGamers(players: (1...3).map { Player(identifier: "player\($0)") })
        game = .fiveCardStud(gamers: players)
    }
    
    private func configuerStackView() {
        initPlayersStackView()
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
    }
    
    private func initCardStackView() -> UIStackView {
        let stack = UIStackView()
        game.pushCardToView { card in
            let cardView = UIImageView()
            card?.apply(imageView: cardView)
            cardView.snp.makeConstraints { (make) in
                make.height.equalTo(cardView.snp.width).multipliedBy(1.27)
                stack.addArrangedSubview(cardView)
            }
        }
        stack.spacing = -8
        return stack
    }
    
    private func initPlayerStackView(identifier: String) -> UIStackView {
        let stack = UIStackView()
        let playerIdentifier = UILabel()
        playerIdentifier.text = identifier
        stack.addArrangedSubview(playerIdentifier)
        stack.addArrangedSubview(initCardStackView())
        playerIdentifier.snp.makeConstraints { (make) in
            make.height.equalTo(stack.snp.height).multipliedBy(0.2)
        }
        stack.axis = .vertical
        return stack
    }
    
    private func initPlayersStackView() {
        game.pushPlayerToView { player in
            stackView.addArrangedSubview(initPlayerStackView(identifier: player.identifier))
        }
    }
}
