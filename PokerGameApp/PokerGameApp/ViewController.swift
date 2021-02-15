//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        }
        
        self.view.addSubview(imageStackView)
        imageStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/10).isActive = true
        imageStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        let numberOfCards = 7
        for _ in 0..<numberOfCards {
            let newCardImageView = cardIn()
            imageStackView.addArrangedSubview(newCardImageView)
            newCardImageView.widthAnchor.constraint(equalTo: imageStackView.heightAnchor, multiplier: 1/1.27).isActive = true
        }
    }
    
    func cardIn() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "card-back")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

