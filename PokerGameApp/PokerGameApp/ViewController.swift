//
//  ViewController.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private let hand = HandView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCardHand()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setCardHand() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: CardImage.background) ?? UIImage())
        self.view.addSubview(hand)
        hand.setConstraint(superView: self.view)
    }
}

