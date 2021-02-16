//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        drawCard()
        print(Card(rank: .J, suit: .clubs))
        print(Card(rank: .Five, suit: .hearts))
    }
    
    
    func setBackGround () {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png") ?? UIImage())
    }
    
    func drawCard() {
        guard let cardImage : UIImage = UIImage(named: "card-back.png") else { return }
        let numberOfCard = 7
        let divideSizeOfCard: CGFloat = CGFloat(numberOfCard) + 1
        let padding : CGFloat = 5
        let width = self.view.bounds.width / divideSizeOfCard
        let height = width * 1.27
        
        for i in 0..<numberOfCard{
            let posX = width * CGFloat(i) + (padding * CGFloat(i)) + padding
            let posY : CGFloat = 44
            let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))

            imageView.image = cardImage
            self.view.addSubview(imageView)
        }
    }
    
}

