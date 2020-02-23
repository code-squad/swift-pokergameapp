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
        setupStack()
        setupView()
    }
    
    private func setupStack() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 20
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
        setAllParticipantViewsNotHidden()
        updateSelectedParticipantViews(gameStut: gameStut, playersNum: playersNum)
        setNotParticipantViewsHidden(playersNum: playersNum)
    }
    
    private func setAllParticipantViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func updateSelectedParticipantViews(gameStut: PokerGame.GameStut,playersNum: Players.Number) {
        var playersNumCount = 0
        playersNum.forEach {
            playersNumCount += 1
        }
        updatePlayers(gameStut: gameStut, playersNumCount: playersNumCount)
        updateDealer(gameStut: gameStut, playersNumCount: playersNumCount)
    }
    
    private func setNotParticipantViewsHidden(playersNum: Players.Number) {
        let dealerCount = 1
        var participantsCount = dealerCount
        playersNum.forEach {
            participantsCount += 1
        }
        
        for index in participantsCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
    
    private func updatePlayers(gameStut: PokerGame.GameStut, playersNumCount: Int) {
        for index in 0 ..< playersNumCount {
            let participantStackView = arrangedSubviews[index] as! ParticipantStackView
            participantStackView.updateView(name: "Players\(index + 1)", gameStut: gameStut)
        }
    }
    
    private func updateDealer(gameStut: PokerGame.GameStut, playersNumCount: Int) {
        let dealerCount = 1
        let dealerIndex = playersNumCount + dealerCount - 1
        let dealerStackView = arrangedSubviews[dealerIndex] as! ParticipantStackView
        dealerStackView.updateView(name: "Dealer", gameStut: gameStut)
    }
}
