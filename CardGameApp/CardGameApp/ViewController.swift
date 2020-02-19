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
    private var pokerGame: PokerGame!
    let gameTypeTitles = ["7 Cards", "5 Cards"]
    let playerCountTitles = ["2명", "3명", "4명"]
    
    lazy var gameTypeSegmentedControl = TitledSegmentedControl(items: gameTypeTitles)
    lazy var playerCountSegmentedControl = TitledSegmentedControl(items: playerCountTitles)
    
    lazy var segmentedControlStackView: UIStackView = {
        let stackView = SegmentedControlStackView()
        stackView.addArrangedSubview(gameTypeSegmentedControl)
        stackView.addArrangedSubview(playerCountSegmentedControl)
        return stackView
    }()
    let pokerGameStackView: UIStackView = PokerGameStackView()
    let winnerCrownImageView: UIImageView = WinnerCrownImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSegmentActions()
        resetPokerGame()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        resetPokerGame()
    }
    
    private func setupSegmentActions() {
        gameTypeSegmentedControl.addTarget(self, action: #selector(handleGameTypeSegmentChanged), for: .valueChanged)
        playerCountSegmentedControl.addTarget(self, action: #selector(handlePlayerCountSegmentChanged), for: .valueChanged)
    }
    
    private func resetPokerGame() {
        self.pokerGame = PokerGame(game: gameType, numberOfPlayers: playerCount)
        pokerGame.resetPlayers()
        resetPokerGameStackView()
        resetPlayersHand()
    }
    
    private func findWinner() {
        self.pokerGame.findWinner { (winner) in
            DispatchQueue.main.async {
                self.updateView(with: winner)
            }
        }
    }
    
    private func resetPlayersHand() {
        DispatchQueue.global(qos: .userInitiated).sync {
            self.gameType.forEachCard {
                self.pokerGame.passCardToPlayers { (players) in
                    DispatchQueue.main.async {
                        self.updateViews(with: players)
                    }
                }
            }
            findWinner()
        }
    }
    
    private func resetPokerGameStackView() {
        winnerCrownImageView.alpha = 0
        pokerGameStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        pokerGame.forEachPlayer{
            let playerStackView = PlayerStackView(player: $0)
            pokerGameStackView.addArrangedSubview(playerStackView)
        }
    }
    
    private func updateViews(with players: Players) {
        pokerGameStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        players.forEachPlayer { (player) in
            let playerStackView = PlayerStackView(player: player)
            pokerGameStackView.addArrangedSubview(playerStackView)
        }
    }
    
    private func updateView(with winner: Player) {
        pokerGameStackView.arrangedSubviews.forEach { (stackView) in
            let playerStackView = stackView as! PlayerStackView
            if playerStackView.player == winner {
                winnerCrownImageView.centerYAnchor.constraint(equalTo: playerStackView.centerYAnchor, constant: 4).isActive = true
                UIView.animate(withDuration: 1) {
                    self.winnerCrownImageView.alpha = 1
                }
            }
        }
    }
    
    @objc private func handleGameTypeSegmentChanged(segmentedControl: UISegmentedControl) {
        gameType = GameType(index: segmentedControl.selectedSegmentIndex)
        resetPokerGame()
    }
    
    @objc private func handlePlayerCountSegmentChanged(segmentedControl: UISegmentedControl) {
        playerCount = PlayerCount(index: segmentedControl.selectedSegmentIndex)
        resetPokerGame()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        
        view.addSubview(segmentedControlStackView)
        segmentedControlStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        segmentedControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        segmentedControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        segmentedControlStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlStackView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        view.addSubview(pokerGameStackView)
        pokerGameStackView.topAnchor.constraint(equalTo: segmentedControlStackView.bottomAnchor, constant: 16).isActive = true
        pokerGameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54).isActive = true
        pokerGameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        pokerGameStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        view.addSubview(winnerCrownImageView)
        winnerCrownImageView.trailingAnchor.constraint(equalTo: pokerGameStackView.leadingAnchor, constant: -12).isActive = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
