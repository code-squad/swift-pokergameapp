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
    private lazy var pokerGame: PokerGame = PokerGame(game: gameType, numberOfPlayers: playerCount)
    
    let gameTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handleGameTypeSegmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    let playerCountSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handlePlayerCountSegmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    
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
    
    let pokerGameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .top
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        resetPokerGame()
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
            let playerStackView = generatePlayerStackView()
            let cardStackView = generateCardStackView()
            
            let playerLabel = UILabel()
            playerLabel.textColor = .white
            playerLabel.text = "Player \(i + 1)"
            if i == players.count - 1 { playerLabel.text = "Dealer" }
            
            player.hands.map { $0.description }
                .forEach {
                    cardStackView.addArrangedSubview(generateCardImageView(named: $0))
                }
            
            playerStackView.addArrangedSubview(playerLabel)
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
    
    private func generateCardImageView(named: String) -> UIImageView {
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
    
    private func generatePlayerStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func generateCardStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = -8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
