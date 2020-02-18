//
//  ViewController.swift
//  CardGameApp
//
//  Created by JW on 2020/02/07.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameMode: Mode.GameMode = .sevenCardStud
    var playerMode: Mode.PlayerMode = .four
    var pokerGame: PokerGame!
    var playersStackView: UIStackView!
    var cardsStackView: UIStackView!
    
    func generateStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
        
    var cardImage = UIImageView()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        playersStackView = generateStackView(axis: .vertical, spacing: 40)
        view.addSubview(playersStackView)
        for _ in 1...(playerMode.rawValue + 1) {
            cardsStackView = generateStackView(axis: .horizontal, spacing: -8)
            playersStackView.addArrangedSubview(cardsStackView)
            addConstraintsToStackViews()
            addCardsToStackView()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func addConstraintsToStackViews() {
        cardsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cardsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        playersStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
    }
    
    func startPokerGame() {
        self.pokerGame = PokerGame(gameMode: gameMode, playerMode: playerMode)
        self.pokerGame.giveCards()
    }

    func setCardImage() -> UIImageView? {
        startPokerGame()
        guard let pickedCard = pokerGame.pickOneCard() else { return nil }
        let cardImage = matchImageToCardInfo(suit: pickedCard.suit, rank: pickedCard.rank)
        cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardImage
    }
    
    func addCardsToStackView() {
        for _ in 1...gameMode.rawValue {
            guard let cardImage = setCardImage() else { return }
            cardsStackView.addArrangedSubview(cardImage)
        }
    }
    
    func matchImageToCardInfo(suit: Card.Suit, rank: Card.Rank) -> UIImageView {
        let suitString: String
        let rankString: String
        
        suitString = suit.description
        rankString = rank.description
        
        cardImage = UIImageView(image: UIImage(named: "\(suitString)\(rankString).png")!)
        cardImage.contentMode = .scaleAspectFit
        cardImage.layer.cornerRadius = 5
        cardImage.clipsToBounds = true
        return cardImage
    }
}
