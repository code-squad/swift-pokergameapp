//
//  ViewController.swift
//  CardGameApp
//
//  Created by JW on 2020/02/07.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        view.addSubview(cardStackView)
        
        for _ in 1...7 {
            let cardBackImage = UIImageView(image: #imageLiteral(resourceName: "card-back"))
            cardBackImage.contentMode = .scaleAspectFit
            cardStackView.addArrangedSubview(cardBackImage)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

