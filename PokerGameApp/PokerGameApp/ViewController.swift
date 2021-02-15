//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        setupCard()
    }

    func setupBackgroundImage() {
        guard let bgImage = UIImage(named: "bg_pattern") else {
            return
        }
        self.view.backgroundColor = .init(patternImage: bgImage)
    }
    
    func setupCard() {
        
        let cardWidth = view.frame.size.width/7
        let cardHeight = cardWidth * 1.27
        
        // 카드 이미지뷰 생성
        let card1 = UIImageView(image: UIImage(named: "card-back"))
        let card2 = UIImageView(image: UIImage(named: "card-back"))
        let card3 = UIImageView(image: UIImage(named: "card-back"))
        let card4 = UIImageView(image: UIImage(named: "card-back"))
        let card5 = UIImageView(image: UIImage(named: "card-back"))
        let card6 = UIImageView(image: UIImage(named: "card-back"))
        let card7 = UIImageView(image: UIImage(named: "card-back"))
        
        // 카드를 담을 스택뷰
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(card1)
        stackView.addArrangedSubview(card2)
        stackView.addArrangedSubview(card3)
        stackView.addArrangedSubview(card4)
        stackView.addArrangedSubview(card5)
        stackView.addArrangedSubview(card6)
        stackView.addArrangedSubview(card7)
        
        // add subview
        view.addSubview(stackView)
        
        // stackview autolayout
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
}
