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
        
        // 카드를 담을 스택뷰
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for _ in 0..<7 {
            stackView.addArrangedSubview(makeCard())
        }
        
        // add subview
        view.addSubview(stackView)
        
        // stackview autolayout
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
    
    func makeCard() -> UIImageView {
        return UIImageView(image: UIImage(named:  "card-back"))
    }
}
