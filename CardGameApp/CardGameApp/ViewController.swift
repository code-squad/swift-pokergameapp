//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pokerGame = PokerGame(gameType: .sevenCardStud, numberOfPlayers: .four)
    
    var gameTypeControl: UISegmentedControl = {
        let segments = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        return segments
    }()
    
    var numberOfPlayersControl: UISegmentedControl = {
        let segments = UISegmentedControl(items: ["2명", "3명", "4명"])
        segments.selectedSegmentIndex = 0
        segments.translatesAutoresizingMaskIntoConstraints = false
        return segments
    }()
    
    var playerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
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
        pokerGame.play()
        makeGame()
        setPlayerStackLayout()
    }
    
    func resetPlayerStack() {
        playerStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func addGameTypeControl() {
        view.addSubview(gameTypeControl)
        gameTypeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func addNumberOfPlayersControl() {
        view.addSubview(numberOfPlayersControl)
        numberOfPlayersControl.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 10).isActive = true
        numberOfPlayersControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberOfPlayersControl.leadingAnchor.constraint(equalTo: gameTypeControl.leadingAnchor).isActive = true
        numberOfPlayersControl.trailingAnchor.constraint(equalTo: gameTypeControl.trailingAnchor).isActive = true
    }
    
    func makeGame() {
        var index = 1
        pokerGame.players.forEach {
            let playerLabel = makePlayerLabel(playerName: "Player\(index)")
            if index == pokerGame.players.count {
                playerLabel.text = "Dealer"
            }
            let playerCard = makePlayer($0)
            playerStack.addArrangedSubview(playerLabel)
            playerStack.addArrangedSubview(playerCard)
            playerLabel.bottomAnchor.constraint(equalTo: playerCard.topAnchor).isActive = true
            index += 1
        }
        self.view.addSubview(playerStack)
    }
    
    func setPlayerStackLayout() {
        playerStack.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 50).isActive = true
        playerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        playerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
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
    
    func makePlayer(_ player: Player) -> UIStackView {
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

