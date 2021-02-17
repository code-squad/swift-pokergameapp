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
        setCard()
        
        var test = Test()
        test.startTest()
    }
    
    
    func setBackGround () {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png") ?? UIImage())
    }
    
    func setCard() {
        let cardImage : UIImage = UIImage(named: "card-back.png") ?? UIImage()
        let numberOfCard = 7
        let divideSizeOfCard: CGFloat = CGFloat(numberOfCard) + 1
        let padding : CGFloat = 5
        let width = self.view.bounds.width / divideSizeOfCard
        let height = width * 1.27
        let cardRange = 0..<numberOfCard
        let posY : CGFloat = 44

        for i in cardRange{
            let posX = width * CGFloat(i) + (padding * CGFloat(i)) + padding
            let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))

            imageView.image = cardImage
            self.view.addSubview(imageView)
        }
    }
    
}

