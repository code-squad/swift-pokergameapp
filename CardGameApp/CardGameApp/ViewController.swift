//
//  ViewController.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func specifyStackViewProperty(of stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func makeCardViews() -> UIStackView {
        let stackView = UIStackView()
        specifyStackViewProperty(of: stackView)
        
        for _ in 0..<7 {
            let cardView = UIImageView(image: UIImage(named: "card-back"))
            stackView.addArrangedSubview(cardView)
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
        }
        
        return stackView
    }
    
    private func setView() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        
        let stackView = makeCardViews()
        self.view.addSubview(stackView)
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
