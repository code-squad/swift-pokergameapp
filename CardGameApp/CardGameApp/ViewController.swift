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
    
    let studSegmented: UISegmentedControl = {
        let studs = ["7 Cards", "5 Cards"]
        let segmentedControl = UISegmentedControl(items: studs)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        return segmentedControl
    }()
    
    let playerSegmented: UISegmentedControl = {
        let playerCount = ["2명", "3명", "4명"]
        let segmentedControl = UISegmentedControl(items: playerCount)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 1.0
        return segmentedControl
    }()
    
    let playerGameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let playerLabel: UILabel = {
        let label = UILabel()
        label.text = "Player 1"
        label.textColor = .white
        label.font.withSize(10.0)
        return label
    }()
    
    let wholeGameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
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
        
        studSegmented.center = CGPoint(x: self.view.frame.width/2, y: 90)
        self.view.addSubview(studSegmented)
        self.view.addSubview(playerSegmented)
        
        playerSegmented.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        
        playerGameStack.addArrangedSubview(playerLabel)
        playerGameStack.addArrangedSubview(cardImageStack)
        self.view.addSubview(playerGameStack)
        
        wholeGameStack.addArrangedSubview(playerGameStack)
        wholeGameStack.addArrangedSubview(playerGameStack)
        self.view.addSubview(wholeGameStack)

        setStackContraints()

        
    }
    
    func setStackContraints() {
        let constraints = [
            playerSegmented.leadingAnchor.constraint(equalTo: studSegmented.leadingAnchor),
            playerSegmented.trailingAnchor.constraint(equalTo: studSegmented.trailingAnchor),
            playerSegmented.topAnchor.constraint(equalTo: studSegmented.bottomAnchor, constant: 10),
            wholeGameStack.topAnchor.constraint(equalTo: playerSegmented.bottomAnchor, constant: 30),
            wholeGameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            wholeGameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

