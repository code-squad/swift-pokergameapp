//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    private func setBackground() {
        if let tile = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: tile)
        }
    }
}
