//
//  ViewController.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: StateController.backgroundImg) ?? UIImage())
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

