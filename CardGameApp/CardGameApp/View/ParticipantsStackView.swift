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
    
    func updateView(game: PokerGame) {
        setAllParticipantViewsNotHidden()
        updateSelectedParticipantViews(game: game)
        setNotParticipantViewsHidden(participantsNum: game.participantsNum)
    }
    
    private func setAllParticipantViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func updateSelectedParticipantViews(game: PokerGame) {
        var playersIndex = 0
        game.searchPlayers { (player) in
            updatePlayer(at: playersIndex, player: player)
            playersIndex += 1
        }
        
        let playersCount = playersIndex
        game.searchDealer { (dealer) in
            updateDealer(playersCount: playersCount,dealer: dealer)
        }
    }
    
    private func updatePlayer(at index: Int, player: Player) {
        let participantStackView = arrangedSubviews[index] as! ParticipantStackView
        participantStackView.updateView(name: "Players\(index + 1)", player: player)
    }
    
    private func updateDealer(playersCount: Int, dealer: Player) {
        let dealerCount = 1
        let dealerIndex = playersCount + dealerCount - 1
        let dealerStackView = arrangedSubviews[dealerIndex] as! ParticipantStackView
        dealerStackView.updateView(name: "Dealer", player: dealer)
    }
    
    private func setNotParticipantViewsHidden(participantsNum: Int) {
        for index in participantsNum ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
}
