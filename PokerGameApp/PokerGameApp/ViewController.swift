//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        addCards(count: 7)
    }
    
    private func setBackground() {
        if let tile = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: tile)
        }
    }
    
    private func addCards(count: CGFloat) {
        guard let cardBack = UIImage(named: "card-back.png") else { return }
        
        let fullWidth = self.view.bounds.width
        let marginUp = self.view.bounds.height/10
        let marginRL = fullWidth/count/10
        let cardWidth = (fullWidth - marginRL*(count+1))/count
        
        for i in 0..<Int(count) {
            let cardView = UIImageView(image: cardBack)
            cardView.frame = CGRect(x: cardWidth*CGFloat(i) + marginRL*(CGFloat(i)+1),
                                    y: marginUp,
                                    width: cardWidth,
                                    height: cardWidth*1.27)
            cardView.contentMode = .scaleAspectFit
            view.addSubview(cardView)
        }
    }
}
