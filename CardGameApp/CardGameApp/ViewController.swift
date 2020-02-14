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
        let rule = ["\(Descriptions.Rule.seven)", "\(Descriptions.Rule.five)"]
        let number = ["\(Descriptions.Number.two)", "\(Descriptions.Number.three)", "\(Descriptions.Number.four)"]
        let selection = PlayModeSelectionViewContents(rule: rule, numberOfPlayers: number)
        let view = PlayModeSelectionView(with: selection)
        return view
    }()
    
    private lazy var gamePlayView: GamePlayView = {
        let view = GamePlayView(maxParticipantNumber: Descriptions.shared.maxPlayers)
        return view
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundPattern()
        
        view.addSubview(selectionView)
        layoutSelectionView()
        
        view.addSubview(gamePlayView)
        layoutGamePlayView()
        
        selectionView.delegate = self
        playGame(with: PlayMode(rule: .sevenCardStud, number: .two))
    }
    
    private func playGame(with mode: PlayMode) {
        let rule: GamePlay.Rule
        let numberOfPlayers: Players.Number
        
        switch mode.rule {
        case .sevenCardStud: rule = .sevenCardStud
        case .fiveCardStud: rule = .fiveCardStud
        }
        
        switch mode.number {
        case .two: numberOfPlayers = .two
        case .three: numberOfPlayers = .three
        case .four: numberOfPlayers = .four
        }
        
        let gamePlay = GamePlay(rule: rule, numberOfPlayers: numberOfPlayers)
        gamePlay.deal()
        let table = gamePlay.table()
        let cards = table.map { $0.map { "\($0)" } }
        
        gamePlayView.contents = GamePlayViewContents(cards: cards)
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
    
    private func layoutGamePlayView() {
        let safeArea = view.safeAreaLayoutGuide
        gamePlayView.topAnchor.constraint(equalTo: selectionView.bottomAnchor).isActive = true
        gamePlayView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20).isActive = true
        gamePlayView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20).isActive = true
    }
}

extension ViewController: PlayModeSelectionViewDelegate {
    func didModeChanged(to mode: PlayMode) {
        playGame(with: mode)
    }
}
