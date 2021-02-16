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
        makeACard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setCardHand() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: CardImage.background) ?? UIImage())
        self.view.addSubview(hand)
        hand.setConstraint(superView: self.view)
    }
    
    private func makeACard() {
        let card = Card(rank: Rank(1), suit: .spades)
        print(card.description)
    }
}

