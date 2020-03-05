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
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupProperties()
        setupParticipantsStackViews()
    }
    
    private func setupProperties() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupParticipantsStackViews() {
        addParticipantsStackViews()
    }
    
    private func addParticipantsStackViews() {
        Participants.forEachMaxCase {
            addArrangedSubview(ParticipantStackView())
        }
    }
    
    func updateView(game: PokerGame) {
        setAllParticipantViewsNotHidden()
        updateSelectedParticipantViews(game: game)
        setNotParticipantViewsHidden(game: game)
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
            if game.participants.isWinner(participant: participant) {
                updateWinner(at: participantsIndex ,participant: participant)
            }
            participantsIndex += 1
        }
    }
    
    private func updateParticipant(at index: Int, participant: Participant) {
        guard index < arrangedSubviews.count else {
            return
        }
        
        let participantStackView = arrangedSubviews[index] as! ParticipantStackView
        participantStackView.updateView(name: participant.name, participant: participant)
    }
    
    private func updateWinner(at index: Int, participant: Participant) {
        guard index < arrangedSubviews.count else {
            return
        }
        
        let participantStackView = arrangedSubviews[index] as! ParticipantStackView
        participantStackView.updateWinnerView(participant: participant)
    }
    
    private func setNotParticipantViewsHidden(game: PokerGame) {
        var participantsCount = 0
        game.participants.forEach {
            participantsCount += 1
        }
        
        for index in participantsCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
    
}
