//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    let cardBackImage = UIImage(named: "card-back.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "bg_pattern.png") ?? UIImage()))
        showCards(cardNum: 7)
        testCard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func makeCard() -> UIView {
        let cardBackImageView = UIImageView(image: cardBackImage)
        let cardConstraint = NSLayoutConstraint(item: cardBackImageView,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: cardBackImageView,
                                                attribute: .width,
                                                multiplier: 1.27,
                                                constant: 0)
        cardBackImageView.addConstraint(cardConstraint)
        cardBackImageView.clipsToBounds = true
        cardBackImageView.layer.cornerRadius = 5
        
        return cardBackImageView
    }
    
    func showCards(cardNum: Int) {
        var cards = [UIView]()
        (0..<cardNum).forEach{ _ in
            cards.append(makeCard())
        }

        let cardStackView = UIStackView(arrangedSubviews: cards)
        cardStackView.axis = .horizontal
        cardStackView.alignment = .fill
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 5
        
        self.view.addSubview(cardStackView)
        cardStackView.translatesAutoresizingMaskIntoConstraints = false

        cardStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        cardStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
    }
    
    func testCard(){
        var card = Card(shape: .Heart, rank: .queen)
        print(card)
        card = Card(shape: .Spade, rank: .seven)
        print(card)
    }
}

