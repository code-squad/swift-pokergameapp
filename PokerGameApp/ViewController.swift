//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    var cardImage : UIImage = {
        return UIImage(named: "cardback.png")!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        
        let cardWidth = (self.view.bounds.maxX - self.view.bounds.minX) / 8
        let cardHeight = cardWidth * 1.27
        let offset = cardWidth / 6
        
        for index in 0..<7 {
            let imageView = UIImageView(frame: CGRect(x: self.view.frame.minX + (cardWidth + offset) * CGFloat(index),
                                                      y: self.view.frame.minY + cardHeight,
                                                      width: cardWidth, height: cardHeight))
            imageView.image = cardImage
            self.view.addSubview(imageView)
        }
        
    }
}

