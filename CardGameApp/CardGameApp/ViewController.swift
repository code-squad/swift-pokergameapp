//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCards()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        self.view.addSubview(cardStack)
        cardStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        cardStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        cardStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    func makeCards() {
        for _ in 0..<7 {
            let card = UIImageView(image: #imageLiteral(resourceName: "card-back"))
            card.contentMode = .scaleAspectFit
            cardStack.addArrangedSubview(card)
        }
    }
}

