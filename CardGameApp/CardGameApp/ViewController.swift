//
//  ViewController.swift
//  CardGameApp
//
//  Created by delma on 05/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var playerCount = PokerGame.PlayerCount.one
    private var studNumber = PokerGame.Stud.seven
    private var pokerGame: PokerGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK:- Segmented Contoll
    
    let studSegmented: UISegmentedControl = {
        let studs = ["7 Cards", "5 Cards"]
        let segmentedControl = UISegmentedControl(items: studs)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        segmentedControl.addTarget(self, action: #selector(studSegmentControl(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let playerSegmented: UISegmentedControl = {
        let playerCount = ["1명", "2명", "3명", "4명"]
        let segmentedControl = UISegmentedControl(items: playerCount)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        segmentedControl.addTarget(self, action: #selector(playerCountControl(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    // MARK:- Stack Views
    
    let wholeGameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let dealerGameStack:  UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    func setUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        startPokerGame(playerCount: playerCount, stud: studNumber)
        
        studSegmented.center = CGPoint(x: self.view.frame.width/2, y: 90)
        self.view.addSubview(studSegmented)
        self.view.addSubview(playerSegmented)
        
        playerSegmented.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        
        self.view.addSubview(wholeGameStack)
        self.view.addSubview(dealerGameStack)
        
        setStackContraints()
    }
    
    func setStackContraints() {
        let constraints = [
            playerSegmented.leadingAnchor.constraint(equalTo: studSegmented.leadingAnchor),
            playerSegmented.trailingAnchor.constraint(equalTo: studSegmented.trailingAnchor),
            playerSegmented.topAnchor.constraint(equalTo: studSegmented.bottomAnchor, constant: 10),
            wholeGameStack.topAnchor.constraint(equalTo: playerSegmented.bottomAnchor, constant: 20),
            wholeGameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            wholeGameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            dealerGameStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            dealerGameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dealerGameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func makePlayerLabel(playerNumber: Int) -> UILabel {
        let label = UILabel()
        label.text = "Player \(playerNumber)"
        label.textColor = .white
        label.font.withSize(10.0)
        return label
    }
    
    func makeGameStack(playerNumber: Int, cardImageStack: UIStackView) -> UIStackView {
        let medalImage = UIImageView(image: UIImage(named: "medal.png"))
        let labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 5
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        labelStack.addArrangedSubview(makePlayerLabel(playerNumber: playerNumber))
        labelStack.addArrangedSubview(medalImage)
        medalImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.isHidden = true
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(labelStack)
        stackView.addArrangedSubview(cardImageStack)
        return stackView
    }
    
    func makeCardImageStack() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = -10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    
    func startPokerGame(playerCount: PokerGame.PlayerCount, stud: PokerGame.Stud) {
        pokerGame = PokerGame(playerCount: playerCount, stud: stud)
        setPlayersCards()
        setDealerCards()
        findWinner()
    }
    
    func setPlayersCards() {
        wholeGameStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        pokerGame.allocateCards()
        var number = 1
        pokerGame.forEachPlayer { player in
            let cardImageStack = makeCardImageStack()
            player.forEachCard { (card) in
                let cardImage = UIImageView(image: UIImage(named: card.description))
                cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
                cardImageStack.addArrangedSubview(cardImage)
            }
            let labelImageStack = makeGameStack(playerNumber: number, cardImageStack: cardImageStack)
            number += 1
            wholeGameStack.addArrangedSubview(labelImageStack)
        }
    }
    
    func setDealerCards() {
        dealerGameStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let cardImageStack = makeCardImageStack()
        
        let dealerLabel: UILabel = {
            let label = UILabel()
            label.text = "Dealer"
            label.textColor = .white
            label.font.withSize(10.0)
            return label
        }()
        
        let medalImage = UIImageView(image: UIImage(named: "medal.png"))
        let labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 5
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        labelStack.addArrangedSubview(dealerLabel)
        labelStack.addArrangedSubview(medalImage)
        medalImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.isHidden = true
        
        
        pokerGame.forEachDealerCards { (card) in
            let cardImage = UIImageView(image: UIImage(named: card.description))
            cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
            cardImageStack.addArrangedSubview(cardImage)
        }
        dealerGameStack.addArrangedSubview(labelStack)
        dealerGameStack.addArrangedSubview(cardImageStack)
    }
    
    func findWinner() {
        var isPlayerWin = false
        pokerGame.compareResults()
        var playerNumber = 0
        
        pokerGame.forEachPlayer { (player) in
            if player.isWinner {
                isPlayerWin = true
                let eachPlayerStack = wholeGameStack.arrangedSubviews[playerNumber] as! UIStackView
                let labelStack = eachPlayerStack.arrangedSubviews[0] as! UIStackView
                let medalImage = labelStack.arrangedSubviews[1]
                medalImage.isHidden = false
            }
            playerNumber += 1
        }
        
        guard !isPlayerWin else { return }
        
        if pokerGame.judgeDealerWin() {
            let labelStack = dealerGameStack.arrangedSubviews[0] as! UIStackView
            let medalImage = labelStack.arrangedSubviews[1]
            medalImage.isHidden = false
        }
        
    }
    
    @objc func studSegmentControl(_ segmentedControl: UISegmentedControl) {
        studNumber = PokerGame.Stud.init(index: segmentedControl.selectedSegmentIndex)
        
        startPokerGame(playerCount: playerCount, stud: studNumber)
    }
    
    @objc func playerCountControl(_ segmentedControl: UISegmentedControl) {
        playerCount = PokerGame.PlayerCount.init(index: segmentedControl.selectedSegmentIndex)
        
        startPokerGame(playerCount: playerCount, stud: studNumber)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        startPokerGame(playerCount: playerCount, stud: studNumber)
    }
}

