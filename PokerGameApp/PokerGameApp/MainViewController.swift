//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let filepath = Bundle.main.path(forResource: "bg_pattern", ofType: "png")!
        self.view.backgroundColor = UIColor(patternImage: UIImage(contentsOfFile: filepath)!)
        
        var imgView: [UIImageView] = []
        var width: CGFloat = 0
        let height: CGFloat = self.view.bounds.height / 10
        let imgWidth: CGFloat = 50
        let imgHeight: CGFloat = imgWidth * 1.27
        
        for i in 0..<7 {
            imgView.append(UIImageView(frame: CGRect(x: width, y: height, width: imgWidth, height: imgHeight)))
            imgView[i].image = UIImage(named: "card-back.png")
            self.view.addSubview(imgView[i])
            width += self.view.bounds.width / 7
        }
        
        let card1 = Card(10, Card.Shapes.diamonds)
        let card2 = Card(11, Card.Shapes.hearts)
        let card3 = Card(12, Card.Shapes.clobers)
        let card4 = Card(13, Card.Shapes.spades)
        let card5 = Card(1, Card.Shapes.hearts)
        card1.printInfo()
        card2.printInfo()
        card3.printInfo()
        card4.printInfo()
        card5.printInfo()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}

