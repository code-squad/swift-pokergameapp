//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    
    func loadImg() -> UIImage? {
        guard let filepath = Bundle.main.path(forResource: "bg_pattern", ofType: "png") else {
            return nil
        }
        guard let img = UIImage(contentsOfFile: filepath) else {
            return nil
        }
        return img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let img = loadImg() else {
            print("파일경로가 잘못되었습니다.")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: img)
        
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
        printTestResult()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func printTestResult() {
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
}

