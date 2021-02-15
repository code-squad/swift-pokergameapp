//
//  ViewController.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private let hand = Hand()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCardHand()
        setCard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setCardHand() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: CardImage().backgroundImg) ?? UIImage())
        self.view.addSubview(hand)
        hand.setConstraint(superView: self.view)
    }
    
    private func setCard() {
        let card = Card(value: CardValue.init(integerLiteral: 12), suit: Suit.hearts)
        print(card.description)
    }
}

