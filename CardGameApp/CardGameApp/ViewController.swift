//
//  ViewController.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: override

    ///StatusBar 스타일을 lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)

        drawCards(cardCount: 7)
    }

    //MARK: private func
    /// 카드를 갯수를 입력받은 만큼 그려준다.
    private func drawCards(cardCount: Int) {
        let bounds = UIScreen.main.bounds
        let space = 10
        let ratio = 1.27
        var cardX = CGFloat(space)
        let cardY = CGFloat(50)
        let allSpace = (cardCount + 1) * space
        let cardWidth = (bounds.width - CGFloat(allSpace)) / CGFloat(cardCount)
        let cardHeight = cardWidth * CGFloat(ratio)

        for _ in 0..<cardCount {
            let cardFrame = CGRect(x: cardX, y: cardY, width: cardWidth, height: cardHeight)
            let imageView = CardImageView(frame: cardFrame)
            cardX = cardX + cardWidth + CGFloat(space)
            self.view.addSubview(imageView)
        }
    }

}
