//
//  ViewController.swift
//  CardGameApp
//
//  Created by JW on 2020/02/07.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let playersStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 40
        return stack
    }()

    var cardStackView: UIStackView!
    func createCardsStackView() -> UIStackView {
        cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = -10
        return cardStackView
    }
        
    var cardImage = UIImageView()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        view.addSubview(playersStackView)
        for _ in 1...5 {
            playersStackView.addArrangedSubview(createCardsStackView())
            addConstraintsToStack()
            addCardsToStackView()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func addConstraintsToStack() {
        cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        playersStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
    }
    
    let pokerGame = PokerGame(gameMode: .sevenCardStud, playerMode: .four)
    func setCardImage() -> UIImageView? {
        guard let pickedCard = pokerGame.showDealer().pickOneCard() else { return nil }
        let cardImage = matchImageToCardInfo(suit: pickedCard.suit, rank: pickedCard.rank)
        cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardImage
    }
    
    func addCardsToStackView() {
        for _ in 1...7 {
            guard let cardImage = setCardImage() else { return }
            cardStackView.addArrangedSubview(cardImage)
        }
    }
    
    func matchImageToCardInfo(suit: Card.Suit, rank: Card.Rank) -> UIImageView {
        let suitString: String
        let rankString: String
        
        switch suit {
        case .clubs:
            suitString = "c"
        case .diamonds:
            suitString = "d"
        case .hearts:
            suitString = "h"
        case .spades:
            suitString = "s"
        }
        
        rankString = rank.description
        
        cardImage = UIImageView(image: UIImage(named: "\(suitString)\(rankString).png")!)
        cardImage.contentMode = .scaleAspectFit
        cardImage.layer.cornerRadius = 5
        cardImage.clipsToBounds = true
        return cardImage
    }
}
