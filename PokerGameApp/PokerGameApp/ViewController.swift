//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    let cardBackImage: UIImage = {
        UIImage(named: "card-back") ?? UIImage()
    }()
    let card = Card(shape: .diamond, number: .king)
    let card2 = Card(shape: .diamond, number: .seven)
    var testCardGame = TestCardGame()
    var pokerGame = PokerGame(playerNumber: .one, gameType: .seven)
    var mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        print(card)
        print(card2)
        //testCardGame.testGame()
        pokerGame.startGame()
    }
    
    private func initialize() {
        drawBackground()
        initMainStackView()
    }
    
    private func writeParticipantNameLabel(name: String) -> UILabel {
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        return nameLabel
    }
    
    private func initMainStackView() {
        mainStackView.addArrangedSubview(writeParticipantNameLabel(name: "참가자"))
        mainStackView.addArrangedSubview(createCardStackView())
        mainStackView.addArrangedSubview(writeParticipantNameLabel(name: "딜러"))
        mainStackView.addArrangedSubview(createCardStackView())
        self.view.addSubview(mainStackView)
        
        let margin = view.layoutMarginsGuide
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        mainStackView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 0).isActive = true
    }
    
    private func drawBackground() {
        if let image = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }

    private func createCardImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = cardBackImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }
    
    private func createCardStackView() -> UIStackView {
        let stackView = UIStackView()
        let numberOfCard = 7
        let intervalBetweenCards: CGFloat = -5
        
        for _ in 0..<numberOfCard {
            stackView.addArrangedSubview(createCardImageView())
        }

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = intervalBetweenCards

        return stackView
    }
    
    //상태바 글씨를 흰색으로 변경
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
}

