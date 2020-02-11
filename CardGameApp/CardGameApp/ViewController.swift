//
//  ViewController.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var gameType: GameType = .sevenCardsStud
    
    let gameTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handleSegmentChanged), for: .valueChanged)
        return segmentedControl
    }()

    let cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let card1 = Card(suit: .heart, rank: .king)
        print(card1)
        let card2 = Card(suit: .spade, rank: .ace)
        print(card2)
        
        setupUI()
    }
    
    @objc private func handleSegmentChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            gameType = .sevenCardsStud
        } else {
            gameType = .fiveCardsStud
        }
    }
    
    private func cardImageView() -> UIImageView {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "card-back"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        
        for _ in 0..<7 {
            cardStackView.addArrangedSubview(cardImageView())
        }
        
        view.addSubview(gameTypeSegmentedControl)
        gameTypeSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        gameTypeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        view.addSubview(cardStackView)
//        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
//        cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
