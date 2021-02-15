//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Issac on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }

        let imageStackView = UIStackView()
        createCardInsideStackView(imageStackView)
        configImageStackView(imageStackView)
        self.view.addSubview(imageStackView)
        configConstraintStackView(imageStackView)
        
        
        let cardA = Card(.hearts, .queen)
        let cardB = Card(.spades, .seven)
        print(cardA, cardB)
    }
    
    private func createCardInsideStackView(_ stackView: UIStackView) {
        for _ in 1...7 {
            let image = UIImage(named: "card-back.png")!
            let imageView = UIImageView(image: image)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5
            
            let aspectRatioConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: (1.27 / 1.0), constant: 0)
            imageView.addConstraint(aspectRatioConstraint)
            stackView.addArrangedSubview(imageView)
        }
        
    }
    
    private func configImageStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
    }
    
    private func configConstraintStackView(_ stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = self.view.layoutMarginsGuide
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10).isActive = true
    }
}

