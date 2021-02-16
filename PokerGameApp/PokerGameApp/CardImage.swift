//
//  CardImage.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

enum CardImage {
    static let background = "bg_pattern"
    static let cardBack = "card-back"
    static let widthRatio: CGFloat = 1.0
    static let heightRatio: CGFloat = 1.27
}

struct CardBack {
    private (set) var cardBack: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: CardImage.cardBack)
        
        let ratio = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: (CardImage.heightRatio / CardImage.widthRatio), constant: 0)
        imageView.addConstraint(ratio)
        
        return imageView
    }()
}
