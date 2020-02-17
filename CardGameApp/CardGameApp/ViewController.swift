//
//  ViewController.swift
//  CardGameApp
//
//  Created by JW on 2020/02/07.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .yellow
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        view.addSubview(cardStackView)
 
        addConstraintsToStack()
        addCardsToStackView()
        
//        let pokerGame = PokerGame(gameMode: .sevenCardStud, playerMode: .three)
//        pokerGame.giveCards()
//        pokerGame.giveCards()
//
//        let pokerGame2 = PokerGame(gameMode: .fiveCardStud, playerMode: .three)
//        pokerGame2.giveCards()
//        pokerGame2.giveCards()
        
//        view.addSubview(matchImageToCardInfo(suit: .spades, rank: .ten))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func addConstraintsToStack() {
        cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    func setCardBackImage() -> UIImageView {
        let cardBackImage = UIImageView(image: #imageLiteral(resourceName: "card-back"))
        cardBackImage.heightAnchor.constraint(equalTo: cardBackImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardBackImage
    }
    
    func addCardsToStackView() {
        for _ in 1...7 {
            let cardBackImage = setCardBackImage()
            cardBackImage.contentMode = .scaleAspectFit
            cardStackView.addArrangedSubview(cardBackImage)
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
    
        return UIImageView(image: UIImage(named: "\(suitString)\(rankString).png")!)
    }
}
