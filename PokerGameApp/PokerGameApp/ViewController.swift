//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        setBackground()
        createCardStackView()
    }
    
    func setBackground() {
        if let image = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func createCardImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "card-back")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        
        return imageView
    }
    
    func createCardStackView() {
        let stackView = UIStackView()
        
        for _ in 0..<7 {
             stackView.addArrangedSubview(createCardImageView())
        }

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
    }
    
    //상태바 글씨를 흰색으로 변경
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
}

