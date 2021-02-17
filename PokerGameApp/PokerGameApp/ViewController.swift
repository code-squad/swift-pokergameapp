//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    let cardBackImage: UIImage = {
        UIImage(named: "card-back") ?? UIImage()
    }()
    let card = Card(shape: .diamond, number: .king)
    let card2 = Card(shape: .diamond, number: .seven)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        print(card)
        print(card2)
    }
    
    private func initialize() {
        drawBackground()
        createCardStackView()
    }
    
    private func drawBackground() {
        if let image = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }

    private func createCardImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = cardBackImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        
        return imageView
    }
    
    private func createCardStackView() {
        let stackView = UIStackView()
        let numberOfCard = 7
        let intervalBetweenCards: CGFloat = 5
        
        for _ in 0..<numberOfCard {
            stackView.addArrangedSubview(createCardImageView())
        }

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = intervalBetweenCards
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
    }
    
    //상태바 글씨를 흰색으로 변경
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
}

