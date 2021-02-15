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
    
    let cardBackgroundImage : UIImage = {
        guard let image = UIImage(named: "card-back") else {
            return UIImage()
        }
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:
                                                backgroundImageChange(imageName: "bg_pattern"))
        
        self.view.addSubview(horizontalStackView)
        constrainUI()
        makeCard()
        
        print(Card(suit: .club, rank: .A))
        print(Card(suit: .diamond, rank: .ten))
        print(Card(suit: .heart, rank: .Q))
    }


    func backgroundImageChange(imageName : String) -> UIImage {
        guard let backgroundimage = UIImage(named: imageName) else {
            return UIImage()
        }
        return backgroundimage
    }
    
    private func constrainUI() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            horizontalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
    }
    
    private func makeCard()  {
        (0...6).forEach { _ in
            horizontalStackView.addArrangedSubview(createImageView())
        }
    }

    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = cardBackgroundImage
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return imageView
    }
}

