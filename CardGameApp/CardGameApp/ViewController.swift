//
//  ViewController.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/05.
//  Copyright © 2020 Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        
        // 카드 이미지 생성
        for _ in 1...7 {
            stackView.addArrangedSubview(createCardView())
        }
        stackView.distribution = .fillEqually
    }
    
    fileprivate func createCardView() -> UIImageView {
        let newImage = #imageLiteral(resourceName: "card-back")
        let newView = UIImageView(image: newImage)
        newView.contentMode = .scaleAspectFill
        newView.backgroundColor = .yellow
        newView.widthAnchor.constraint(equalToConstant: newImage.size.width).isActive = true
        newView.heightAnchor.constraint(equalToConstant: newImage.size.width * 1.27).isActive = true
        
        return newView
    }
}

