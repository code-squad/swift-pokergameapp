//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class CardViewController: UIViewController {
    
    static let cardCount : Int = 7 // 카드의 개수
    static let aspectRatio : CGFloat = 1.27 // 카드의 가로 세로 비율
    static let padding : CGFloat = (CGFloat(cardCount)-1) // 카드의 간격의 갯수 (7개의 카드이므로 간격은 6번존재)
    
    let cardImage : UIImage? = {
        return UIImage(named: "cardback.png")
    }()
    
    let backgroundImagePattern : UIImage? = {
        return UIImage(named: "bg_pattern")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        drawSevenCards()
    }
    
    func setBackgroundColor(){
        guard let backimage = backgroundImagePattern else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backimage)
    }
    
    func drawSevenCards(){
        
        let cardWidth = (self.view.bounds.maxX - self.view.bounds.minX) / CGFloat(CardViewController.cardCount + 1)
        let cardHeight = cardWidth * CardViewController.aspectRatio
        let offset = cardWidth / CardViewController.padding
        
        for index in 0..<CardViewController.cardCount {
            let startpointX = self.view.frame.minX + (cardWidth + offset) * CGFloat(index)
            let startpointY = self.view.frame.minY + cardHeight
            
            let imageView = UIImageView(frame: CGRect(x: startpointX,
                                                      y: startpointY,
                                                      width: cardWidth, height: cardHeight))
            imageView.image = cardImage
            self.view.addSubview(imageView)
        }
    }
}

