//
//  ViewController.swift
//  CardGameApp
//
//  Created by JW on 2020/02/07.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var gameMode: Mode.GameMode = .sevenCardStud
    private var playerMode: Mode.PlayerMode = .four
    private var pokerGame: PokerGame!
    private var roleLabel: UILabel!
    private var gameBoardStackView: UIStackView!
    private var cardsStackView: UIStackView!
    private var playerView: UIView!
    private var gameModeStackView: UIStackView!
    private var studSegmentedControl: UISegmentedControl!
    private var playerSegmentedControl: UISegmentedControl!
        
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setUpView() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        gameModeStackView = generateStackView(axis: .vertical, spacing: 15)
        studSegmentedControl = generateSegmentedControl(item: ["7 Cards", "5 Cards"], seletecIndex: 0)
        playerSegmentedControl = generateSegmentedControl(item: ["2명", "3명", "4명"], seletecIndex: 2)
        view.addSubview(gameModeStackView)
        gameModeStackView.addArrangedSubview(studSegmentedControl)
        gameModeStackView.addArrangedSubview(playerSegmentedControl)
        startPokerGame()
    }
    
    func generateSegmentedControl(item: [Any], seletecIndex: Int) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: item)
        segmentedControl.selectedSegmentIndex = seletecIndex
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
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
        NSLayoutConstraint.activate([
        gameModeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        gameModeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        gameBoardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        gameBoardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        gameBoardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
        gameBoardStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        roleLabel.bottomAnchor.constraint(equalTo: cardsStackView.topAnchor),
        cardsStackView.leadingAnchor.constraint(equalTo: playerView.leadingAnchor),
        cardsStackView.trailingAnchor.constraint(equalTo: playerView.trailingAnchor)
        ])
    }
    
    func startPokerGame() {
        self.pokerGame = PokerGame(gameMode: gameMode, playerMode: playerMode)
        self.pokerGame.giveCards()
        gameBoardStackView = generateStackView(axis: .vertical, spacing: 40)
        view.addSubview(gameBoardStackView)
        setUpForPlayers()
        setUpForDealer()
    }

    func setUpCards(cards: [Card]) {
        cardsStackView = generateStackView(axis: .horizontal, spacing: -7)
        for card in cards {
            let matchedCard: UIImageView = matchImageToCardInfo(suit: card.suit, rank: card.rank)
            cardsStackView.addArrangedSubview(matchedCard)
        }
        playerView.addSubview(cardsStackView)
        gameBoardStackView.addArrangedSubview(playerView)
        addConstraintsToStackViews()
    }
    
    func setUpForPlayers() {
        var number = 1
        for particiapnt in pokerGame.showParticipants() {
            playerView = UIView()
            roleLabel = generateRoleLabel(role: "Player\(number)")
            playerView.addSubview(roleLabel)
            setUpCards(cards: particiapnt.statusOfOwnCards())
            number += 1
        }
    }
    
    func setUpForDealer() {
        playerView = UIView()
        roleLabel = generateRoleLabel(role: "Dealer")
        playerView.addSubview(roleLabel)
        setUpCards(cards: pokerGame.showDealer().statusOfOwnCards())
    }
    
    func matchImageToCardInfo(suit: Card.Suit, rank: Card.Rank) -> UIImageView {
        let suitString = suit
        let rankString = rank
        let cardImage = UIImageView(image: UIImage(named: "\(suitString)\(rankString).png")!)
        cardImage.contentMode = .scaleAspectFit
        cardImage.layer.cornerRadius = 5
        cardImage.clipsToBounds = true
        cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardImage
    }
}
