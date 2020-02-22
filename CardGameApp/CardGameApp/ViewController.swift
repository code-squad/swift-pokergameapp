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
    var labelStackView: UIStackView!
    var gameModeStackView: UIStackView!
    var studSegmentedControl: UISegmentedControl!
    var playerSegmentedControl: UISegmentedControl!
        
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        gameModeStackView = generateStackView(axis: .vertical, spacing: 15)
        view.addSubview(gameModeStackView)
        studSegmentedControl = generateSegmentedControl(item: ["7 Cards", "5 Cards"])
        playerSegmentedControl = generateSegmentedControl(item: ["2명", "3명", "4명"])
        gameModeStackView.addArrangedSubview(studSegmentedControl)
        gameModeStackView.addArrangedSubview(playerSegmentedControl)
        
        playersStackView = generateStackView(axis: .vertical, spacing: 40)
        view.addSubview(playersStackView)
        showCardImages()
        addConstraintsToStackViews()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func generateSegmentedControl(item: [Any]) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: item)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        
        return segmentedControl
    }
    
    func generateStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        
        return stackView
    }
    
    func addConstraintsToStackViews() {
        gameModeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        gameModeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        cardsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cardsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        playersStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        playersStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    func startPokerGame() {
        self.pokerGame = PokerGame(gameMode: gameMode, playerMode: playerMode)
        self.pokerGame.giveCards()
    }

    func showCardImages() {
        startPokerGame()
        for particiapnt in pokerGame.showParticipants() {
            cardsStackView = generateStackView(axis: .horizontal, spacing: -7)
            for card in particiapnt.statusOfRoleAndCards().cards {
                let matchedCard: UIImageView = matchImageToCardInfo(suit: card.suit, rank: card.rank)
                matchedCard.heightAnchor.constraint(equalTo: matchedCard.widthAnchor, multiplier: 1.27).isActive = true
                cardsStackView.addArrangedSubview(matchedCard)
                playersStackView.addArrangedSubview(cardsStackView)
            }
        }

        cardsStackView = generateStackView(axis: .horizontal, spacing: -5)
        let dealerOwnCard = pokerGame.showDealer().statusOfRoleAndCards().cards
        for card in dealerOwnCard {
            let matchedCard: UIImageView = matchImageToCardInfo(suit: card.suit, rank: card.rank)
            matchedCard.heightAnchor.constraint(equalTo: matchedCard.widthAnchor, multiplier: 1.27).isActive = true
            cardsStackView.addArrangedSubview(matchedCard)
            playersStackView.addArrangedSubview(cardsStackView)
        }
    }
    
    func matchImageToCardInfo(suit: Card.Suit, rank: Card.Rank) -> UIImageView {
        let suitString = suit
        let rankString = rank
        
        let cardImage = UIImageView(image: UIImage(named: "\(suitString)\(rankString).png")!)
        cardImage.contentMode = .scaleAspectFit
        cardImage.layer.cornerRadius = 5
        cardImage.clipsToBounds = true
        return cardImage
    }
}
