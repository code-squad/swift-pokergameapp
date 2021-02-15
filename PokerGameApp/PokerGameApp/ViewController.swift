//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let cardBackside = UIImage(named: "card-back.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        addCards(count: 7)
    }
    
    private func setBackground() {
        guard let tile = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: tile)
    }
    
    private func addCards(count: Int) {
        
        let cntInCGF = CGFloat(count)
        
        let fullWidth = self.view.bounds.width
        let marginUp = self.view.bounds.height/10
        let marginRL = fullWidth/cntInCGF/10

        let cardWidth = (fullWidth - marginRL*(cntInCGF+1))/cntInCGF
        
        for i in 0..<count {
            let cardView = UIImageView(image: cardBackside)
            cardView.frame = CGRect(x: cardWidth*CGFloat(i) + marginRL*(CGFloat(i)+1),
                                    y: marginUp,
                                    width: cardWidth,
                                    height: cardWidth*1.27)
            view.addSubview(cardView)
        }
    }
}
