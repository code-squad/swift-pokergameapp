//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 한천희 on 2021/02/16.
//

import UIKit

class PokerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }


}

