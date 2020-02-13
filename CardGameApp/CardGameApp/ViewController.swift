//
//  ViewController.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/05.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var selectionView: PlayModeSelectionView = {
        let rule = [RuleDescription.seven, RuleDescription.five]
        let number = [NumberDescription.two, NumberDescription.three, NumberDescription.four]
        let selection = PlayModeSelectionViewDescription(rule: rule, numberOfPlayers: number)
        let view = PlayModeSelectionView(with: selection)
        return view
    }()
    
    private lazy var participantView: ParticipantView = {
        let cards = ["c2", "c2", "c2", "c2", "c2", "c2", "c2"]
        let overlappedCards = OverlappedCardsViewDescription(cards: cards)
        let participant = ParticipantViewDescription(name: "Player1", cards: overlappedCards)
        let view = ParticipantView(with: participant)
        return view
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundPattern()
        
        view.addSubview(selectionView)
        view.addSubview(participantView)
        layoutSelectionView()
        layoutParticipantView()
        
        selectionView.delegate = self
    }
    
    private func setBackgroundPattern() {
        if let backgroundPatternImage = UIImage(named: "bg_pattern") {
            view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        }
    }
    
    private func layoutSelectionView() {
        let safeArea = view.safeAreaLayoutGuide
        selectionView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        selectionView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
    
    private func layoutParticipantView() {
        let safeArea = view.safeAreaLayoutGuide
        participantView.topAnchor.constraint(equalTo: selectionView.bottomAnchor).isActive = true
        participantView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20).isActive = true
        participantView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20).isActive = true
    }
}

extension ViewController: PlayModeSelectionViewDelegate {
    func didModeChanged(to mode: PlayMode) {
        
    }
}
