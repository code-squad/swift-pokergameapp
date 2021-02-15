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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: StateController.backgroundImg) ?? UIImage())
        self.view.addSubview(hand)
        hand.setConstraint(superView: self.view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

