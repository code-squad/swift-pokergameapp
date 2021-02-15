//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class CardViewController: UIViewController {
    
    let cardImage : UIImage? = {
        return UIImage(named: "cardback.png")
    }()
    
    let backgroundImagePattern : UIImage? = {
        return UIImage(named: "bg_pattern")
    }()
    
    private struct Ratio{
        static let totalNumOfCards : CGFloat = 7 // 카드의 개수
        static let cadRatio : CGFloat = 1.27 // 카드의 가로 세로 비율
        static let countOffset : CGFloat = (totalNumOfCards-1) // 카드의 간격의 갯수 (7개의 카드이므로 간격은 6번존재)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        drawSevenCards()
        
        let myCard = PlayingCard(suit: .hearts, rank: .ace)
        print(myCard.description)
    }
    
    func setBackgroundColor(){
        guard let backimage = backgroundImagePattern else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backimage)
    }
    
    func drawSevenCards(){
        
        let cardWidth = (self.view.bounds.maxX - self.view.bounds.minX) / (Ratio.totalNumOfCards + CGFloat(1))
        let cardHeight = cardWidth * Ratio.cadRatio
        let offset = cardWidth / Ratio.countOffset
        
        for index in 0..<Int(Ratio.totalNumOfCards) {
            let imageView = UIImageView(frame: CGRect(x: self.view.frame.minX + (cardWidth + offset) * CGFloat(index),
                                                      y: self.view.frame.minY + cardHeight,
                                                      width: cardWidth, height: cardHeight))
            imageView.image = cardImage
            self.view.addSubview(imageView)
        }
    }
}

