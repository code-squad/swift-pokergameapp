//
//  ParticipantsStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ParticipantsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setup()
        setupView()
    }
    
    private func setup() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 40
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
        let dealerCount = 1
        var maxNum = dealerCount
        Players.Number.four.forEach {
            maxNum += 1
        }
        
        for _ in 0 ..< maxNum {
            addArrangedSubview(ParticipantStackView())
        }
    }
    
    func updateView(gameStut: PokerGame.GameStut, playersNum: Players.Number) {
        arrangedSubviews.forEach {
            $0.isHidden = true
        }
        
        let dealerCount = 1
        var playersNumCount = dealerCount
        playersNum.forEach {
            playersNumCount += 1
        }
        for index in 0 ..< playersNumCount {
            let participantStackView = arrangedSubviews[index] as! ParticipantStackView
            participantStackView.isHidden = false
            participantStackView.updateView(gameStut: gameStut)
        }
    }
}
