//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    
    func loadImg(resource: String, type: String) -> UIImage? {
        guard let filepath = Bundle.main.path(forResource: resource, ofType: type) else {
            return nil
        }
        guard let img = UIImage(contentsOfFile: filepath) else {
            return nil
        }
        return img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let backgroundImg = loadImg(resource: "bg_pattern", type: "png") else {
            print("파일경로가 잘못되었습니다.")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImg)
        
        var imgView: [UIImageView] = []
        var width: CGFloat = 0
        let height: CGFloat = self.view.bounds.height / 10
        let imgWidth: CGFloat = 50
        let imgHeight: CGFloat = imgWidth * 1.27
        
        guard let cardImg = loadImg(resource: "card-back", type: "png") else {
            print("파일경로가 잘못되었습니다.")
            return
        }
        
        for i in 0..<7 {
            imgView.append(UIImageView(frame: CGRect(x: width, y: height, width: imgWidth, height: imgHeight)))
            imgView[i].image = cardImg
            self.view.addSubview(imgView[i])
            width += self.view.bounds.width / 7
        }
        printTestResult()
        testScenario()
        pockerGameScenario()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func printTestResult() {
        let card1 = Card(Card.Nums.ten, Card.Shapes.diamonds)
        let card2 = Card(Card.Nums.jack, Card.Shapes.hearts)
        let card3 = Card(Card.Nums.queen, Card.Shapes.clobers)
        let card4 = Card(Card.Nums.king, Card.Shapes.spades)
        let card5 = Card(Card.Nums.one, Card.Shapes.hearts)
        print(card1)
        print(card2)
        print(card3)
        print(card4)
        print(card5)
    }
}

