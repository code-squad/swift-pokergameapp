//
//  StackView.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/24.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

// 최상위 스택뷰라고 생각.
class GameStackView: UIStackView {
    private let pokerGame: GameTable
    
    init(pokerGame: GameTable) {
        self.pokerGame = pokerGame
        super.init(frame: .zero)
        topStackViewSetup()
    }
    
    // 최상위 스택뷰 생성
    // 라벨과 카드스택뷰를 집어넣는 스택뷰 생성 - 2번째 스택뷰
    // 카드스택뷰 생성 = 3번째 스택뷰
    override init(frame: CGRect) {
        pokerGame = GameTable()
        super.init(frame: frame)
        topStackViewSetup()
    }
    
    required init(coder: NSCoder) {
        pokerGame = GameTable()
        super.init(coder: coder)
        topStackViewSetup()
        
    }
    
    // 최상위 스택뷰
    private func topStackViewSetup() {
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 20
        self.translatesAutoresizingMaskIntoConstraints = false
        
        pokerGame.participants.players.forEach { (player) in
            self.addArrangedSubview(playerInfoStackView(player: player))
        }
    }
    
    // 플레이어 정보 스택뷰 (라벨 + 카드스택뷰)
    private func playerInfoStackView(player: Player) -> UIStackView {
        let playerStackView = UIStackView()
        playerStackView.axis = .vertical
        playerStackView.distribution = .fill
        playerStackView.spacing = 1
        playerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        playerStackView.addArrangedSubview(createNameLabel(name: player.name))
        playerStackView.addArrangedSubview(cardStackView(cardDeck: player.handDeck))
        
        return playerStackView
    }
    
    // 카드 스택뷰
    private func cardStackView(cardDeck: [Card]) -> UIStackView {
        let playerCardStackView = UIStackView()
        playerCardStackView.axis = .horizontal
        playerCardStackView.distribution = .fill
        playerCardStackView.spacing = -5
        playerCardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cardDeck.forEach { (card) in
            let cardImg = UIImageView(image: UIImage(named: "\(card)"))
            cardImg.translatesAutoresizingMaskIntoConstraints = false
            cardImg.heightAnchor.constraint(equalTo: cardImg.widthAnchor, multiplier: 1.27).isActive = true
            playerCardStackView.addArrangedSubview(cardImg)
        }
        
        return playerCardStackView
    }
    
    // 플레이어 라벨
    private func createNameLabel(name: String) -> UILabel {
        let playerLabel = UILabel()
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        playerLabel.text = name
        playerLabel.textAlignment = .left
        playerLabel.textColor = .white
        
        return playerLabel
    }
}
