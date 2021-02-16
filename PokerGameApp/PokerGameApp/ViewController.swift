//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

<<<<<<< HEAD
    let cardBackImage = UIImage(named: "card-back.png")
    lazy var width = view.bounds.width/7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "bg_pattern.png") ?? UIImage()))
        showCards(cardNum: 7)
        testCard()
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
        for i in 0..<7 {
            showCardBack(x: i)
        }
>>>>>>> 95d885e9fdf8d99c3ba476339fd9f3daf23b2c79
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

<<<<<<< HEAD
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
        var card = Card(shape: .Heart, num: 12)
        print(card.showCardInfo())
        card = Card(shape: .Spade, num: 7)
        print(card.showCardInfo())
    }
=======
    func showCardBack(x: Int) {
        let cardBackImage = UIImage(named: "card-back.png")
        let cardBackImageView = UIImageView(image: cardBackImage!)
        let width = self.view.bounds.width/7
        
        cardBackImageView.frame = CGRect(x: width*CGFloat(x)+3, y: 50, width: width-5, height: (width-5)*1.27)
        cardBackImageView.layer.cornerRadius = 5
        cardBackImageView.clipsToBounds = true
        view.addSubview(cardBackImageView)
    }
    
>>>>>>> 95d885e9fdf8d99c3ba476339fd9f3daf23b2c79
}

