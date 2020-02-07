//
//  ViewController.swift
//  CardGameApp
//
//  Created by delma on 05/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    let cardImageStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func cardImageView() -> UIImageView {
        let image = UIImageView(image: UIImage(named: "card-back"))
        return image
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        for _ in 0..<7 {
            let cardImage = cardImageView()
            cardImageStack.addArrangedSubview(cardImage)
            cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
        }
        self.view.addSubview(cardImageStack)
        setStackContraints()
    }
    
    func setStackContraints() {
        let constraints = [
            cardImageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            cardImageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            cardImageStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

