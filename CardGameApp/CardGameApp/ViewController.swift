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
    // 스택 뷰 설정
    let cardsStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 4
        
        return horizontalStackView
    }()
   
    // 스택뷰에 넣을 이미지 뷰 생성
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        addCards()
        self.view.addSubview(cardsStack)
    }
}
