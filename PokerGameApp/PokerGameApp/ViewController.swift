//
//  ViewController.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let horizontalStackView : UIStackView  = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:
                                                backgroundImageChange(imageName: "bg_pattern"))
        
        viewAdd()
        viewConstraint()
        cardsCreate()
    }


    func backgroundImageChange(imageName : String) -> UIImage {
        guard let backgroundimage = UIImage(named: imageName) else {
            return UIImage()
        }
        return backgroundimage
    }
    
    func viewAdd() {
        self.view.addSubview(horizontalStackView)
    }
    
    func viewConstraint() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            horizontalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
    }
    
    func cardsCreate()  {
        (0...6).forEach { _ in
            horizontalStackView.addArrangedSubview(imageViewCreate())
        }
    }

    func imageViewCreate() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "card-back")
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return imageView
    }
}

