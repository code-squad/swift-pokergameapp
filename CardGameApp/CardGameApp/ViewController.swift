//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pokerGame = PokerGame(gameType: .fiveCardStud, numberOfPlayers: .two)
    
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
        pokerGame.play()
        makeGame()
        setPlayerStackLayout()
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
        playerStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        playerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        playerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
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

