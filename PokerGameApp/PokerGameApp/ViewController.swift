//
//  ViewController.swift
//  PokerGameApp
//
//  Created by user on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bgImg = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: bgImg)
        }
        
        show7CardBack()
        
        let heartQ = PokerCard(suit: .hearts, rank: .queen)
        let club7 = PokerCard(suit: .clubs, rank: .seven)
        print(heartQ)
        print(club7)
        
        var actionTest = ActionTest()
        actionTest.startTest()
    }

    func show7CardBack() {
        //  카드 7장을 놓을 수 있는 치수 설정
        let cardCount:CGFloat = 7
        let cardWidth = self.view.frame.width / (cardCount + 1)
        let cardHeight = cardWidth * 1.27
        let betweenCard = cardWidth / (cardCount + 1)
        let image = UIImage(named: "card-back")
        
        //  카드를 놓을 초기 위치 설정
        var currentPosition: CGFloat = 0.0
        currentPosition += betweenCard
        
        //  카드 7장 놓기
        for _ in 1...7 {
            let cardImage: UIImageView
            cardImage = UIImageView(frame: CGRect(x: currentPosition, y: self.view.frame.minY + 50, width: cardWidth, height: cardHeight))
            cardImage.image = image
            self.view.addSubview(cardImage)
            
            //  다음 카드의 위치 설정
            currentPosition += betweenCard + cardWidth
        }
    }

}

