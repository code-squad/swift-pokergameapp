//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 한천희 on 2021/02/16.
//

import UIKit

class PokerViewController: UIViewController {
    
    let cardBackName = "card-back.png"
    let cardStackView = UIStackView()
    let cardRatio = CGFloat(1.27)
    
    
    func setUpStackView() {
        cardStackView.axis = .horizontal
        cardStackView.alignment = .fill
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 5
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func createCardBackView() {
        let cardBackView = UIImageView(image: UIImage(named: cardBackName))

        cardBackView.heightAnchor.constraint(equalTo: cardBackView.widthAnchor, multiplier: cardRatio).isActive = true
        
        cardStackView.addArrangedSubview(cardBackView)
    }

    func addCardViewInStackView() {
        view.addSubview(cardStackView)
        cardStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        cardStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true

    }

    func drawCards() {
        
        setUpStackView()
        
        for _ in 1...7 {
            createCardBackView()
        }
        
        addCardViewInStackView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let backgroundImage = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        drawCards()
        
        let test1 = TrumpCard(suit: .clubs, rank: .one)
        let test2 = TrumpCard(suit: .diamonds, rank: .five)
        let test3 = TrumpCard(suit: .hearts, rank: .eleven)
        let test4 = TrumpCard(suit: .spades, rank: .thirteen)
        

        print("\(test1.description)\n\(test2.description)\n\(test3.description)\n\(test4.description)")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

