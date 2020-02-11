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
        
        studSegmented.center = CGPoint(x: self.view.frame.width/2, y: 90)
        self.view.addSubview(studSegmented)
        self.view.addSubview(playerSegmented)

        playerSegmented.translatesAutoresizingMaskIntoConstraints = false
        playerSegmented.leadingAnchor.constraint(equalTo: studSegmented.leadingAnchor).isActive = true
        playerSegmented.trailingAnchor.constraint(equalTo: studSegmented.trailingAnchor).isActive = true
        playerSegmented.topAnchor.constraint(equalTo: studSegmented.bottomAnchor, constant: 10).isActive = true
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        
       
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
        //        self.view.addSubview(cardImageStack)
        //        setStackContraints()
    }
    
    func setStackContraints() {
        let constraints = [
            cardImageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            cardImageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            cardImageStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

