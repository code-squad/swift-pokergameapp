//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let pokerCardImage = UIImage(named: "card-back")
    let cardStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundImage = UIImage(named: "bg_patter") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        for _ in 0..<7 {
            let pokerCardView = UIImageView(image: pokerCardImage)
            pokerCardView.heightAnchor.constraint(equalTo: pokerCardView.widthAnchor, multiplier: 1.27).isActive = true
            cardStackView.addArrangedSubview(pokerCardView)
        }
        
        cardStackView.axis = .horizontal
        cardStackView.alignment = .fill
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 5.0
        
        self.view.addSubview(cardStackView)
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
