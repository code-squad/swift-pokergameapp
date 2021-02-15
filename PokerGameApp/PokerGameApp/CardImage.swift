//
//  CardImage.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

enum CardImageString: String {
    case background = "bg_pattern"
    case cardBack = "card-back"
}

struct CardImage {
    private (set) var cardBack: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: CardImageString.cardBack.rawValue)
        
        let ratio = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: (1.27 / 1.0), constant: 0)
        imageView.addConstraint(ratio)
        
        return imageView
    }()
}
