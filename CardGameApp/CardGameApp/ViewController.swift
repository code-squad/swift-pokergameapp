//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameType: PokerGame.GameType = .sevenCardStud
    var numberOfPlayers: PokerGame.NumberOfPlayers = .two
    var pokerGame: PokerGame!
    
    var gameTypeControl: UISegmentedControl = {
        let segments = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        segments.addTarget(self, action: #selector(gameTypeChanged(segControl:)), for: .valueChanged)
        return segments
    }()
    
    var numberOfPlayersControl: UISegmentedControl = {
        let segments = UISegmentedControl(items: ["2명", "3명", "4명"])
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        segments.addTarget(self, action: #selector(numberOfPlayersChanged(segControl:)), for: .valueChanged)
        return segments
    }()
    
    var gameTable: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 30
        return stack
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        loadGame()
    }
    
    func resetGameTable() {
        gameTable.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func loadGame() {
        pokerGame = PokerGame(gameType: gameType, numberOfPlayers: numberOfPlayers)
        resetGameTable()
        pokerGame.play()
        makeGame()
        setGameTableLayout()
        self.view.layoutIfNeeded()
    }
    
    func addGameTypeControl() {
        view.addSubview(gameTypeControl)
        gameTypeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func gameTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            gameType = .sevenCardStud
            loadGame()
        case 1:
            gameType = .fiveCardStud
            loadGame()
        default:
            break
        }
    }
    
    func addNumberOfPlayersControl() {
        view.addSubview(numberOfPlayersControl)
        numberOfPlayersControl.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 10).isActive = true
        numberOfPlayersControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberOfPlayersControl.leadingAnchor.constraint(equalTo: gameTypeControl.leadingAnchor).isActive = true
        numberOfPlayersControl.trailingAnchor.constraint(equalTo: gameTypeControl.trailingAnchor).isActive = true
    }
    
    @objc func numberOfPlayersChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            numberOfPlayers = .two
            loadGame()
        case 1:
            numberOfPlayers = .three
            loadGame()
        case 2:
            numberOfPlayers = .four
            loadGame()
        default:
            break
        }
    }
    
    func makeGame() {
        var index = 1
        pokerGame.players.forEach {
            let playerLabel = makePlayerLabel(playerName: "Player\(index)")
            if index == pokerGame.players.count {
                playerLabel.text = "Dealer"
            }
            let playerCard = makePlayerCard($0)
            let playerStack: UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                return stack
            }()
            playerStack.addArrangedSubview(playerLabel)
            playerStack.addArrangedSubview(playerCard)
            gameTable.addArrangedSubview(playerStack)
            playerLabel.bottomAnchor.constraint(equalTo: playerCard.topAnchor).isActive = true
            index += 1
        }
        self.view.addSubview(gameTable)
    }
    
    func setGameTableLayout() {
        gameTable.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 50).isActive = true
        gameTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        gameTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func makePlayerLabel(playerName: String) -> UILabel {
        let playerLabel: UILabel = {
            let label = UILabel()
            label.text = playerName
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return playerLabel
    }
    
    func makePlayerCard(_ player: Player) -> UIStackView {
        let cardStack = makeCardStack()
        player.handInfo.forEach {
            let card = makeCard($0)
            cardStack.addArrangedSubview(card)
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
        }
        return cardStack
    }
    
    func makeCardStack() -> UIStackView {
        let cardStack: UIStackView = {
            let stack = UIStackView()
            stack.distribution = .fillEqually
            stack.spacing = -5
            return stack
        }()
        return cardStack
    }
    
    func makeCard(_ cardInfo: Card) -> UIImageView {
        let card: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 3.0
            imageView.clipsToBounds = true
            return imageView
        }()
        card.image = UIImage(named: "\(cardInfo).png")
        return card
    }
}

