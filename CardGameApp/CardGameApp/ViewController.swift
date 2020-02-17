//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var gameType: PokerGame.GameType = .sevenCardStud
    private var numberOfPlayers: PokerGame.NumberOfPlayers = .two
    private var pokerGame: PokerGame!
    
    private var gameTypeControl: UISegmentedControl!
    private var numberOfPlayersControl: UISegmentedControl!
    
    private var gameTable: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 30
        return stack
    }()
    
    private var winnerMedal: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trophy.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        addGameTypeControl()
        addNumberOfPlayersControl()
        loadGame()
    }
    
    // MARK: - Make View
    
    private func resetGameTable() {
        gameTable.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        winnerMedal.removeFromSuperview()
    }
    
    private func loadGame() {
        pokerGame = PokerGame(gameType: gameType, numberOfPlayers: numberOfPlayers)
        resetGameTable()
        pokerGame.play()
        makeGame()
        addWinnerMedal(to: pokerGame.winner)
        setGameTableLayout()
    }
    
    private func makeSegments(items: [String]) -> UISegmentedControl {
        let segments = UISegmentedControl(items: items)
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        segments.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segments.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))], for: .selected)
        segments.layer.borderWidth = 1
        segments.layer.borderColor = UIColor.white.cgColor
        return segments
    }
    
    private func addGameTypeControl() {
        gameTypeControl = makeSegments(items: ["7 Card", "5 Card"])
        view.addSubview(gameTypeControl)
        gameTypeControl.addTarget(self, action: #selector(gameTypeChanged(segControl:)), for: .valueChanged)
        gameTypeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func addNumberOfPlayersControl() {
        numberOfPlayersControl = makeSegments(items: ["2명", "3명", "4명"])
        view.addSubview(numberOfPlayersControl)
        numberOfPlayersControl.addTarget(self, action: #selector(numberOfPlayersChanged(segControl:)), for: .valueChanged)
        numberOfPlayersControl.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 10).isActive = true
        numberOfPlayersControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberOfPlayersControl.leadingAnchor.constraint(equalTo: gameTypeControl.leadingAnchor).isActive = true
        numberOfPlayersControl.trailingAnchor.constraint(equalTo: gameTypeControl.trailingAnchor).isActive = true
    }
    
    private func makeGame() {
        var index = 1
        pokerGame.forEachPlayers {
            let playerLabel = makePlayerLabel(playerName: "Player\(index)")
            if type(of: $0) == type(of: Dealer()) {
                playerLabel.text = "Dealer"
            }
            let playerCard = makePlayerCard($0)
            let playerStack = makePlayerStack(label: playerLabel, card: playerCard)
            gameTable.addArrangedSubview(playerStack)
            index += 1
        }
        self.view.addSubview(gameTable)
    }
    
    private func setGameTableLayout() {
        gameTable.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 50).isActive = true
        gameTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        gameTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
    }
    
    private func addWinnerMedal(to winnerIndex: Int) {
        self.view.addSubview(winnerMedal)
        winnerMedal.topAnchor.constraint(equalTo: gameTable.arrangedSubviews[winnerIndex].topAnchor, constant: 20).isActive = true
        winnerMedal.leftAnchor.constraint(equalTo: gameTable.rightAnchor, constant: 10).isActive = true
        winnerMedal.widthAnchor.constraint(equalToConstant: 50).isActive = true
        winnerMedal.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func makePlayerStack(label: UILabel, card: UIStackView) -> UIStackView {
        let playerStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            return stack
        }()
        playerStack.addArrangedSubview(label)
        playerStack.addArrangedSubview(card)
        return playerStack
    }
    
    private func makePlayerLabel(playerName: String) -> UILabel {
        let playerLabel: UILabel = {
            let label = UILabel()
            label.text = playerName
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return playerLabel
    }
    
    private func makePlayerCard(_ player: Player) -> UIStackView {
        let cardStack = makeCardStack()
        player.forEachCard {
            let card = CardImageView(image: UIImage(named: "\($0).png"))
            cardStack.addArrangedSubview(card)
        }
        return cardStack
    }
    
    private func makeCardStack() -> UIStackView {
        let cardStack: UIStackView = {
            let stack = UIStackView()
            stack.distribution = .fillEqually
            stack.spacing = -5
            return stack
        }()
        return cardStack
    }
    
    // MARK: - Event Processing
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        loadGame()
    }
    
    @objc
    private func gameTypeChanged(segControl: UISegmentedControl) {
        gameType = PokerGame.GameType(index: segControl.selectedSegmentIndex)
        loadGame()
    }
    
    @objc
    private func numberOfPlayersChanged(segControl: UISegmentedControl) {
        numberOfPlayers = PokerGame.NumberOfPlayers(index: segControl.selectedSegmentIndex)
        loadGame()
    }
}
