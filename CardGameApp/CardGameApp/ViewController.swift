//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let trump = Card(suit: .heart, number: .queen)
    
    private let cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardViews()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupCardViews(){
        addCardViews(to: cardStackView)
        self.view.addSubview(cardStackView)
        setConstraintCardStackView()
    }
    
    private func addCardViews(to cardStackView: UIStackView) {
        let maxCardNum = 7
        for _ in 0 ..< maxCardNum {
            cardStackView.addArrangedSubview(generateCardImageView())
        }
    }

    private func generateCardImageView() -> UIImageView {
        let cardImageView = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.heightAnchor.constraint(
            equalTo: cardImageView.widthAnchor,
            multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    private func setConstraintCardStackView() {
        let boundaryConstant: CGFloat = 8
        cardStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: boundaryConstant).isActive = true
        cardStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: boundaryConstant).isActive = true
        cardStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -boundaryConstant).isActive = true
    }

}
