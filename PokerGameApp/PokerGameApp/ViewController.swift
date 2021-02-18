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
        
        if let backgorundImage = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: backgorundImage)
        }
        
        let viewControllerWidth = self.view.frame.maxX
        
        let cardWidth = viewControllerWidth / 8
        let cardHeight = cardWidth * 1.27
        let cardToCard = cardWidth / 8
        
        let cardOriginImage = "card-back.png"
        let cardUIImage = UIImage(named: cardOriginImage)
        
        let firstCardPositionX = cardToCard + cardWidth / 2
        
        for i in 0..<7 {
            
            let cardUIImageView = UIImageView(image: cardUIImage!)
            
            cardUIImageView.frame.size.width = cardWidth
            cardUIImageView.frame.size.height = cardHeight
            
            cardUIImageView.center = CGPoint(x: firstCardPositionX + CGFloat(i) * (cardWidth + cardToCard), y: 100)
            view.addSubview(cardUIImageView)
            
        }
        
        let gameOperator = GameOperator()
        gameOperator.dealerStartGame()
        
    }
    
}


