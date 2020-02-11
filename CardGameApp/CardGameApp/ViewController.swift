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
    private var playerCount: PlayerCount = .two
    
    let gameTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handleGameTypeSegmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    let playerCountSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handlePlayerCountSegmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    lazy var segmentedControlsSV: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            gameTypeSegmentedControl,
            playerCountSegmentedControl
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    @objc private func handleGameTypeSegmentChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            gameType = .sevenCardsStud
        } else {
            gameType = .fiveCardsStud
        }
    }
    
    @objc private func handlePlayerCountSegmentChanged(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            playerCount = .two
        case 1:
            playerCount = .three
        case 2:
            playerCount = .three
        default:
            break
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
        
        view.addSubview(segmentedControlsSV)
        segmentedControlsSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        segmentedControlsSV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        segmentedControlsSV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        segmentedControlsSV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlsSV.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
//        view.addSubview(cardStackView)
//        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
//        cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
