//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
        
        let VCWidth = self.view.frame.maxX
        
        for i in 0..<7 {
            
            let cardOriginImage = "card-back.png"
            let cardUIImage = UIImage(named: cardOriginImage)
            let cardUIImageView = UIImageView(image: cardUIImage!)
            
            let cardWidth = VCWidth / 8
            let cardHeight = cardWidth * 1.27
            let cardToCard = cardWidth / 8
            
            cardUIImageView.frame.size.width = cardWidth
            cardUIImageView.frame.size.height = cardHeight
            
            cardUIImageView.center = CGPoint(x: cardToCard + cardWidth / 2 + CGFloat(i) * (cardWidth + cardToCard), y: 100)
            view.addSubview(cardUIImageView)
            
        }
        
        Card.makeDeck()
        
    }
    
}


