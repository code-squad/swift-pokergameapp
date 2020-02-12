//
//  ViewController.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/06.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpStackView()
        addCardIntoStackView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setUpBackground(){
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        self.view.addSubview(stackView)
    }
    
    func setUpStackView() {
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    func addCardIntoStackView(){
        for _ in 0...6{
            self.stackView.addArrangedSubview(createCard())
        }
    }
    
    func createCard() -> UIImageView{
        let imageView=UIImageView(image: #imageLiteral(resourceName: "card-back"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
}

