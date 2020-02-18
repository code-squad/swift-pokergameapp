//
//  ViewController.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // Stack View
    let cardsStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 4
        
        return horizontalStackView
    }()
    
    // Segment Control
    // - GameMode
    let gameMode: [String] = ["7 Cards", "5 Cards"]
    
    lazy var gameModeSegmentControl: UISegmentedControl = {
        let gameModeSegmentControl: UISegmentedControl = UISegmentedControl(items: gameMode)
        gameModeSegmentControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/12)
        gameModeSegmentControl.backgroundColor = UIColor.gray
        gameModeSegmentControl.tintColor = UIColor.white
        gameModeSegmentControl.addTarget(self, action:
            #selector(gameModeSegmentChanged(segmentControl:)),
                     for: .valueChanged)
        gameModeSegmentControl.selectedSegmentIndex = 0
        return gameModeSegmentControl
        
    }()
    
    // - Players
    
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        
        //StakcView - 카드 뒷면
        addCards()
        self.view.addSubview(cardsStack)
        setStackView ()
        
        //UISegmentedControl - 게임 모드 선택
        self.view.addSubview(self.gameModeSegmentControl)
        //UISegmentedControl - 플레이어 인원 선택
        

    }
    
    // MARK: - Configuration
    // stackView
    func setStackView() {
        cardsStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140).isActive = true
        cardsStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        cardsStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    // StackView에 넣을 이미지 뷰 생성
    func makeCard() -> UIImageView {
        let card = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        card.contentMode = .scaleAspectFit
        card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
        return card
    }
    
    func addCards() {
        for _ in 0 ..< 7 {
            cardsStack.addArrangedSubview(makeCard())
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // segment Control
    
    @objc func gameModeSegmentChanged(segmentControl: UISegmentedControl){
        
    }

    // MARK: - Actions

    @objc
    func selectedSegmentDidChange(_ segmentedControl: UISegmentedControl) {
        print("The selected segment changed for: \(segmentedControl).")
    }
}
