//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pokerGame = PokerGame(gameType: .fiveCardStud, numberOfPlayers: .four)
    
    var playerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
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
        game()
        setPlayerStackLayout()
    }
    
    func game() {
        pokerGame.players.forEach {
            playerStack.addArrangedSubview(makePlayer($0))
        }
        self.view.addSubview(playerStack)
    }
    
    func setPlayerStackLayout() {
        playerStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        playerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        playerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
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

