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
    var roleLabel: UILabel!
    var gameBoardStackView: UIStackView!
    var cardsStackView: UIStackView!
    var playerView: UIView!
    var gameModeStackView: UIStackView!
    var studSegmentedControl: UISegmentedControl!
    var playerSegmentedControl: UISegmentedControl!
        
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        gameModeStackView = generateStackView(axis: .vertical, spacing: 15)
        view.addSubview(gameModeStackView)
        studSegmentedControl = generateSegmentedControl(item: ["7 Cards", "5 Cards"], seletecIndex: 0)
        playerSegmentedControl = generateSegmentedControl(item: ["2명", "3명", "4명"], seletecIndex: 2)
        gameModeStackView.addArrangedSubview(studSegmentedControl)
        gameModeStackView.addArrangedSubview(playerSegmentedControl)
        
        gameBoardStackView = generateStackView(axis: .vertical, spacing: 40)
        view.addSubview(gameBoardStackView)
        startPokerGame()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func generateSegmentedControl(item: [Any], seletecIndex: Int) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: item)
        segmentedControl.selectedSegmentIndex = seletecIndex
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        
        segmentedControl.addTarget(self, action: #selector(handleSegmentChanges), for: .valueChanged)
        
        return segmentedControl
    }
    
    @objc func handleSegmentChanges() {
        if studSegmentedControl.selectedSegmentIndex == 0 {
            gameMode = .sevenCardStud
        } else if studSegmentedControl.selectedSegmentIndex == 1 {
            gameMode = .fiveCardStud
        }
        
        if playerSegmentedControl.selectedSegmentIndex == 0 {
            playerMode = .two
        } else if playerSegmentedControl.selectedSegmentIndex == 1 {
            playerMode = .three
        } else if playerSegmentedControl.selectedSegmentIndex == 2 {
            playerMode = .four
        }
        
        gameBoardStackView.removeFromSuperview()
        gameBoardStackView = generateStackView(axis: .vertical, spacing: 40)
        view.addSubview(gameBoardStackView)
        startPokerGame()
    }
    
    func generateStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        
        return stackView
    }
    
    func generateRoleLabel(role: String) -> UILabel {
        let label = UILabel()
        label.text = role
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func addConstraintsToStackViews() {
        gameModeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        gameModeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        gameBoardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        gameBoardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        gameBoardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        gameBoardStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    func startPokerGame() {
        self.pokerGame = PokerGame(gameMode: gameMode, playerMode: playerMode)
        self.pokerGame.giveCards()
        showCardImages()
        addConstraintsToStackViews()
    }

    func showCardImages() {
        var number = 1
        for particiapnt in pokerGame.showParticipants() {
            playerView = UIView()
            cardsStackView = generateStackView(axis: .horizontal, spacing: -7)
            roleLabel = generateRoleLabel(role: "Player\(number)")
            playerView.addSubview(roleLabel)
            for card in particiapnt.statusOfOwnCards() {
                let matchedCard: UIImageView = matchImageToCardInfo(suit: card.suit, rank: card.rank)
                matchedCard.heightAnchor.constraint(equalTo: matchedCard.widthAnchor, multiplier: 1.27).isActive = true
                cardsStackView.addArrangedSubview(matchedCard)
            }
            playerView.addSubview(cardsStackView)
            roleLabel.bottomAnchor.constraint(equalTo: cardsStackView.topAnchor).isActive = true
            cardsStackView.leadingAnchor.constraint(equalTo: playerView.leadingAnchor).isActive = true
            cardsStackView.trailingAnchor.constraint(equalTo: playerView.trailingAnchor).isActive = true
            gameBoardStackView.addArrangedSubview(playerView)
            number += 1
        }

        playerView = UIView()
        cardsStackView = generateStackView(axis: .horizontal, spacing: -5)
        roleLabel = generateRoleLabel(role: "Dealer")
        playerView.addSubview(roleLabel)
        for card in pokerGame.showDealer().statusOfOwnCards() {
            let matchedCard: UIImageView = matchImageToCardInfo(suit: card.suit, rank: card.rank)
            matchedCard.heightAnchor.constraint(equalTo: matchedCard.widthAnchor, multiplier: 1.27).isActive = true
            cardsStackView.addArrangedSubview(matchedCard)
        }
        playerView.addSubview(cardsStackView)
        roleLabel.bottomAnchor.constraint(equalTo: cardsStackView.topAnchor).isActive = true
        cardsStackView.leadingAnchor.constraint(equalTo: playerView.leadingAnchor).isActive = true
        cardsStackView.trailingAnchor.constraint(equalTo: playerView.trailingAnchor).isActive = true
        gameBoardStackView.addArrangedSubview(playerView)
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
