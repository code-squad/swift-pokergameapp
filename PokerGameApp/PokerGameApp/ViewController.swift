//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameplay()
        let card = Card()
        print(card.returnValue())
    }
    
    func initGameplay(){
        let pattern : UIImage = UIImage(named: "bg_pattern")!
        self.view.backgroundColor = UIColor(patternImage: pattern)
        var CardViewer : [UIImageView] = []
        let cardXpos : CGFloat = self.view.frame.size.width/7
        let offset : CGFloat = CGFloat(self.view.frame.size.width/2) - CGFloat(self.view.frame.width/7 * 4) + CGFloat((self.view.frame.width/8)/2)
        let cardWidth : CGFloat = self.view.frame.size.width/8
        let cardHeight : CGFloat = cardWidth * 1.27
        
        for i in 0..<7{
            let j : CGFloat = CGFloat(i)
            CardViewer.append(UIImageView(image: UIImage(named: "card-back")))
            CardViewer[i].frame = CGRect(x: cardXpos * j - offset, y: 50, width: cardWidth , height: cardHeight)
            self.view.addSubview(CardViewer[i])
        }
    }
}
