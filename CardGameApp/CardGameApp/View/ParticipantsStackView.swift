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
        Participants.Number.four.forEach {
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
        var participantsIndex = 0
        game.searchParticipants { (participant) in
            updateParticipant(at: participantsIndex, participant: participant)
            participantsIndex += 1
        }
    }
    
    private func updateParticipant(at index: Int, participant: Participant) {
        let participantStackView = arrangedSubviews[index] as! ParticipantStackView
        participantStackView.updateView(name: "Player\(index + 1)", participant: participant)
    }
    
    private func setNotParticipantViewsHidden(participantsNum: Int) {
        for index in participantsNum ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
}
