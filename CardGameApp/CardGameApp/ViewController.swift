//
//  ViewController.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var gameType: GameType = .sevenCardsStud
    private var playerCount: PlayerCount = .two
    private var pokerGame: PokerGame = PokerGame(game: .sevenCardsStud, numberOfPlayers: .two)
    
    let gameTypeSegmentedControl = GameTypeSegmentedControl(items: ["7 Cards", "5 Cards"])
    let playerCountSegmentedControl = GameTypeSegmentedControl(items: ["2명", "3명", "4명"])
    
    lazy var segmentedControlsSV: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            gameTypeSegmentedControl,
            playerCountSegmentedControl
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let pokerGameStackView: UIStackView = PokerGameStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSegmentActions()
        resetPokerGame()
    }
    
    private func setupSegmentActions() {
        gameTypeSegmentedControl.addTarget(self, action: #selector(handleGameTypeSegmentChanged), for: .valueChanged)
        playerCountSegmentedControl.addTarget(self, action: #selector(handlePlayerCountSegmentChanged), for: .valueChanged)
    }
    
    private func resetPokerGame() {
        self.pokerGame = PokerGame(game: gameType, numberOfPlayers: playerCount)
        pokerGameStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        resetPlayers()
    }
    
    private func resetPlayers() {
        var players: [Playable] = pokerGame.players
        players.append(pokerGame.dealer)
        players.enumerated().forEach { (i, player) in
            var displayName = "Player \(i + 1)"
            if i == players.count - 1 { displayName = "Dealer" }
            
            let playerStackView = PlayerStackView(displayName: displayName)
            let cardStackView = CardStackView(of: player)
            
            playerStackView.addArrangedSubview(cardStackView)
            pokerGameStackView.addArrangedSubview(playerStackView)
        }
    }
    
    @objc private func handleGameTypeSegmentChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            gameType = .sevenCardsStud
        } else {
            gameType = .fiveCardsStud
        }
        resetPokerGame()
    }
    
    @objc private func handlePlayerCountSegmentChanged(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            playerCount = .two
        case 1:
            playerCount = .three
        case 2:
            playerCount = .four
        default:
            break
        }
        resetPokerGame()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        
        view.addSubview(segmentedControlsSV)
        segmentedControlsSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        segmentedControlsSV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        segmentedControlsSV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        segmentedControlsSV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlsSV.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        view.addSubview(pokerGameStackView)
        pokerGameStackView.topAnchor.constraint(equalTo: segmentedControlsSV.bottomAnchor, constant: 16).isActive = true
        pokerGameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48).isActive = true
        pokerGameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48).isActive = true
        pokerGameStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
