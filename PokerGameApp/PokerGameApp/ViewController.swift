//
//  ViewController.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackGround()
        makeStackView()
        let cardData = Card(suit: .heart, rank: .seven)
        print(cardData)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func makeBackGround() {
        if let bgImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = .init(patternImage: bgImage)
        }
    }
    
    func makeCardImageView() -> UIImageView {
        let cardImageView = UIImageView()
        let image = UIImage(named: "card-back")
        cardImageView.image = image
        cardImageView.heightAnchor.constraint(equalTo: cardImageView.widthAnchor, multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    func makeStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        for _ in 0..<7 {
            stackView.addArrangedSubview(makeCardImageView())
        }
    }
}


