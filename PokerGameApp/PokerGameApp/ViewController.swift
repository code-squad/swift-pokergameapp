//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let cardGame = Dealer()
    
    @IBAction func studDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            cardGame.cardStud = 5
        case 1:
            cardGame.cardStud = 7
        default:
            cardGame.cardStud = 5
        }
    }
    
    @IBAction func participantsNumDidChange(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            cardGame.participantsNum = 2
//        case 1:
//            cardGame.participantsNum = 3
//        case 2:
//            cardGame.participantsNum = 4
//        default:
//            cardGame.participantsNum = 2
//        }
    }
    
    
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
            
            cardUIImageView.center = CGPoint(x: firstCardPositionX + CGFloat(i) * (cardWidth + cardToCard), y: 200)
            view.addSubview(cardUIImageView)
            
        }
        
        let gameOperator = GameOperator()
        gameOperator.startGame()
        
    }
    
}


