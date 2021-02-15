//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    var cardImage : UIImage? = {
        return UIImage(named: "cardback.png") ?? nil
    }()
    
    var backgroundImagePattern : UIImage? = {
        return UIImage(named: "bg_pattern") ?? nil
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSevenCard()
    }
    
    func drawSevenCard(){

        guard let backimage = backgroundImagePattern else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: backimage)
        
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

