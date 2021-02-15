//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    let cardBackImage = UIImage(named: "card-back.png")
    lazy var width = view.bounds.width/7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "bg_pattern.png") ?? UIImage()))
        for i in 0..<7 {
            showCardBack(x: i)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func showCardBack(x: Int) {
        let cardBackImageView = UIImageView(image: cardBackImage)
        
        cardBackImageView.frame = CGRect(x: width*CGFloat(x)+3, y: 50, width: width-5, height: (width-5)*1.27)
        cardBackImageView.layer.cornerRadius = 5
        cardBackImageView.clipsToBounds = true
        view.addSubview(cardBackImageView)
    }
    
}

