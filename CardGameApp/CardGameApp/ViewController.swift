//
//  ViewController.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/05.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cardDeck: CardDeck?
    
    private var selectionView = PlayModeSelectionView()
    
    private var gamePlayView = GamePlayView()

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
        
        playGame(with: .sevenCardStud, playerCount: .two)
    }
    
    private func shuffleCardDeck() {
        cardDeck = CardDeck()
        let generator = SystemRandomNumberGenerator()
        cardDeck?.shuffle(using: generator)
    }
    
    private func playGame(with rule: GamePlay.Rule, playerCount: Players.Number) {
        shuffleCardDeck()
        let gamePlay = GamePlay(rule: rule, numberOfPlayers: playerCount, cardDeck: cardDeck!)
        gamePlay.deal()
        gamePlay.decideWinner()
        
        gamePlayView.updateGamePlayView(with: gamePlay)
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
        gamePlayView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        gamePlayView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25).isActive = true
    }
}

extension ViewController: PlayModeSelectionViewDelegate {
    func didModeChanged(to rule: GamePlay.Rule, playerCount: Players.Number) {
        gamePlayView.stopAnimation()
        playGame(with: rule, playerCount: playerCount)
    }
}

extension ViewController {
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            selectionView.invokeByMode { (rule, count) in
                playGame(with: rule, playerCount: count)
            }
       }
    }
}
