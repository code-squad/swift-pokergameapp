//
//  ViewController.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/10.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let CardStackView = UIStackView()
    
    let cardRatio = CGFloat(1.27)
    let cardCount = 7
    
    //status bar 설정
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Background 배경 설정
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPattern")!)
        
        setUpStackView()
    }
    
    // stackView 설정 및 view에 등록
    func setUpStackView(){
        self.CardStackView.axis = .horizontal
        self.CardStackView.alignment = .fill
        self.CardStackView.distribution = .fillEqually
        self.CardStackView.spacing = 5
        self.CardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0 ..< 7 {
            addCard()
        }
        
        self.view.addSubview(CardStackView)
        self.CardStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.CardStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        self.CardStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    func addCard() {
        let cardImg = UIImageView(image: UIImage(named: "CardBackground")!)
        cardImg.translatesAutoresizingMaskIntoConstraints = false
        cardImg.heightAnchor.constraint(equalTo: cardImg.widthAnchor, multiplier: cardRatio).isActive = true
        
        self.CardStackView.addArrangedSubview(cardImg)
    }
}

