//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension ViewController: GameSegmentedControlDelegate {
    func segmentedControlIndexChanged(stut: PokerGame.GameStut, players: Players.PlayersNum) {
        
    }
}

class ViewController: UIViewController {
    
    private lazy var gameSegmentedControlStackView: GameSegmentedControlStackView = {
        let stackView = GameSegmentedControlStackView()
        stackView.delegate = self
        return stackView
    }()
    
    private let verticalCardsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let game = PokerGame(gameStut: .five, playersNum: .one)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupSegmentedControls()
        setupCards()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupSegmentedControls() {
        self.view.addSubview(gameSegmentedControlStackView)
        setConstraintControlsStackView()
    }
    
    private func setConstraintControlsStackView() {
        let topConstant: CGFloat = 10
        let sideConstant: CGFloat = 120
        gameSegmentedControlStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: topConstant).isActive = true
        gameSegmentedControlStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: sideConstant).isActive = true
        gameSegmentedControlStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -sideConstant).isActive = true
    }
    
    private func setupCards() {
        addHorizontalCardsStackViewAndCards()
        self.view.addSubview(verticalCardsStackView)
        setConstraintCardsStackView()
    }
    
    private func addHorizontalCardsStackViewAndCards() {
        let participantsNum = game.participantsNum
        for _ in 0 ..< participantsNum {
            verticalCardsStackView.addArrangedSubview(
                generateHorizontalCardsStackViewAndCards())
        }
    }
    
    private func generateHorizontalCardsStackViewAndCards() -> UIStackView {
        let horizontalStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = -100
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        addCardViews(to: horizontalStackView)
        return horizontalStackView
    }
    
    private func addCardViews(to cardStackView: UIStackView) {
        let stutNum = game.stutNum
        for _ in 0 ..< stutNum {
            cardStackView.addArrangedSubview(
                generateCardImageView())
        }
    }
    
    private func generateCardImageView() -> UIImageView {
        let cardImageView = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.heightAnchor.constraint(
            equalTo: cardImageView.widthAnchor,
            multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    
    private func setConstraintCardsStackView() {
        let topConstant: CGFloat = 40
        let leadingConstant: CGFloat = 20
        let trailingConstant: CGFloat = 40
        verticalCardsStackView.topAnchor.constraint(
            equalTo: gameSegmentedControlStackView.bottomAnchor,
            constant: topConstant).isActive = true
        verticalCardsStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: leadingConstant).isActive = true
        verticalCardsStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -trailingConstant).isActive = true
    }
}
