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
    
    var dealerGameStack:  UIStackView = {
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
        
        setSegmentedConstraints()
        setWholeStackContraints()
        setDealerStackConstraints()
    }

    func setSegmentedConstraints() {
        self.view.addSubview(studSegmented)
        self.view.addSubview(playerSegmented)
        studSegmented.center = CGPoint(x: self.view.frame.width/2, y: 90)
        playerSegmented.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        
        playerSegmented.leadingAnchor.constraint(equalTo: studSegmented.leadingAnchor).isActive = true
        playerSegmented.trailingAnchor.constraint(equalTo: studSegmented.trailingAnchor).isActive = true
        playerSegmented.topAnchor.constraint(equalTo: studSegmented.bottomAnchor, constant: 10).isActive = true
    }
    
    func setWholeStackContraints() {
        self.view.addSubview(wholeGameStack)
        
        wholeGameStack.topAnchor.constraint(equalTo: playerSegmented.bottomAnchor, constant: 20).isActive = true
        wholeGameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        wholeGameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    }
    
    func setDealerStackConstraints() {
        self.view.addSubview(dealerGameStack)
        
        dealerGameStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        dealerGameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        dealerGameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func makePlayerLabel(playerNumber: Int, isDealer: Bool) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font.withSize(10.0)
        if isDealer {
            label.text = "Dealer"
        }else {
            label.text = "Player \(playerNumber)"
        }
        
        return label
    }
    
    func makeGameStack(playerNumber: Int, cardImageStack: UIStackView, isDealer: Bool) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelStack = makeLabelStack(playerNumber: playerNumber, isDealer: isDealer)
        stackView.addArrangedSubview(labelStack)
        stackView.addArrangedSubview(cardImageStack)
        
        return stackView
    }
    
    func makeLabelStack(playerNumber: Int, isDealer: Bool) -> UIStackView {
        let medalImage = UIImageView(image: UIImage(named: "medal.png"))
        let labelStack = UIStackView()
        
        labelStack.axis = .horizontal
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 5
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        if !isDealer {
            labelStack.addArrangedSubview(makePlayerLabel(playerNumber: playerNumber, isDealer: isDealer))
        } else {
            labelStack.addArrangedSubview(makePlayerLabel(playerNumber: 0, isDealer: true))
        }
        labelStack.addArrangedSubview(medalImage)
        
        medalImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        medalImage.alpha = 0
        
        return labelStack
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
        findWinnerAndPutMedal()
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
            let labelImageStack = makeGameStack(playerNumber: number, cardImageStack: cardImageStack, isDealer: false)
            number += 1
            wholeGameStack.addArrangedSubview(labelImageStack)
        }
    }
    
    func setDealerCards() {
        dealerGameStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let cardImageStack = makeCardImageStack()
        
        pokerGame.forEachDealerCards { (card) in
            let cardImage = UIImageView(image: UIImage(named: card.description))
            cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
            cardImageStack.addArrangedSubview(cardImage)
        }
        
        dealerGameStack = makeGameStack(playerNumber: 0, cardImageStack: cardImageStack, isDealer: true)
        setDealerStackConstraints()

    }
    
    func findWinnerAndPutMedal() {
        var isPlayerWin = false
        pokerGame.compareResults()
        var playerNumber = 0
        
        pokerGame.forEachPlayer { (player) in
            if player.isWinner {
                isPlayerWin = true
                let eachPlayerStack = wholeGameStack.arrangedSubviews[playerNumber] as! UIStackView
                let labelStack = eachPlayerStack.arrangedSubviews[0] as! UIStackView
                let medalImage = labelStack.arrangedSubviews[1]
                UIView.animate(withDuration: 4) {
                    medalImage.alpha = 1
                }
            }
            playerNumber += 1
        }
        
        guard !isPlayerWin else { return }
        
        if pokerGame.judgeDealerWin() {
            let labelStack = dealerGameStack.arrangedSubviews[0] as! UIStackView
            let medalImage = labelStack.arrangedSubviews[1]
            UIView.animate(withDuration: 4) {
                medalImage.alpha = 1
            }
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

