//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        placeCards()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setBackground(){
        let backgraoundPattern = UIImage(named: "bg_pattern") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgraoundPattern)
    }
    
    private func placeCards(){
        let stackView = UIStackView()
        self.view.addSubview(stackView)
        
        let cardNumber = 7
        let cardWidth = self.view.frame.size.width / CGFloat(cardNumber)
        let cardHeight = cardWidth * 1.27
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        for _ in 0..<cardNumber {
            stackView.addArrangedSubview(getCard())
        }

        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
    
    private func getCard() -> UIImageView {
        return UIImageView(image: UIImage(named: "card-back") ?? UIImage())
    }
}
