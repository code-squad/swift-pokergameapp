//
//  ViewController.swift
//  PokerGameApp
//
//  Created by user on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bgImg = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: bgImg)
        }
        show7CardBack()
    }

    func show7CardBack() {
        let cardWidth = self.view.frame.width / 8
        let cardHeight = cardWidth * 1.27
        let betweenCard = cardWidth / 8
        let image = UIImage(named: "card-back")
        
        var currentPosition: CGFloat = 0.0
        currentPosition += betweenCard
        for _ in 1...7 {
            let cardImage: UIImageView
            cardImage = UIImageView(frame: CGRect(x: currentPosition, y: self.view.frame.minY + 50, width: cardWidth, height: cardHeight))
            cardImage.image = image
            self.view.addSubview(cardImage)
            currentPosition += betweenCard + cardWidth
        }
    }

}

