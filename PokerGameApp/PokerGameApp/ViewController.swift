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
        
        let card1 = Card(suit: .club, rank: .rank13)
        let card2 = Card(suit: .heart, rank: .rank7)
        print(card1)
        print(card2)
    }
    
    private func setBackground() {
        guard let tile = UIImage(named: "bg_pattern.png") else { return }
        view.backgroundColor = UIColor(patternImage: tile)
    }
    
    private func addCards(count: Int) {
        
        let countInCGF = CGFloat(count)
        
        let viewSize = (width: view.bounds.width, height: view.bounds.height)
        let marginRatio: CGFloat = 0.1, cardRatio: CGFloat = 1.27
        
        let marginUp = viewSize.height * marginRatio
        let marginRL = viewSize.width / countInCGF * marginRatio

        let cardWidth = (viewSize.width - marginRL * (countInCGF + 1)) / countInCGF
        
        for i in 0..<count {
            let cardView = UIImageView(image: cardBackside)
            cardView.frame = CGRect(x: cardWidth * CGFloat(i) + marginRL * (CGFloat(i) + 1),
                                    y: marginUp,
                                    width: cardWidth,
                                    height: cardWidth * cardRatio)
            view.addSubview(cardView)
        }
    }
}
