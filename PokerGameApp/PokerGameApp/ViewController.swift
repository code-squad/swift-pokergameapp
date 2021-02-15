//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let pokerCardImage = UIImage(named: "card-back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let backgroundImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        var pokerCardViews: [UIImageView] = []
        for _ in 0..<7 {
            let pokerCardView = UIImageView(image: pokerCardImage)
            pokerCardView.heightAnchor.constraint(equalTo: pokerCardView.widthAnchor, multiplier: 1.27).isActive = true
            pokerCardViews.append(pokerCardView)
        }
        
        let cardStackView = UIStackView(arrangedSubviews: pokerCardViews)
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
