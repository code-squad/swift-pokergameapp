//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    let cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") else {print("Image file missing"); return}
        guard let cardBacksideImage: UIImage = UIImage(named: "card-back") else {print("Image file missing"); return}
        
        self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        self.view.addSubview(cardStackView)
        configureCardStackView(cardStackView: cardStackView)
        addSubviewToCardStackView(numberOfCards: 7, image: cardBacksideImage)
    }
    
    func makeCardImageView(with newImage: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = newImage
        return imageView
    }
    
    func configureCardStackView(cardStackView: UIStackView) {
        cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/10).isActive = true
        cardStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
    }
    
    func addSubviewToCardStackView(numberOfCards: Int, image: UIImage) {
        for _ in 0..<numberOfCards {
            let newCardImageView = makeCardImageView(with: image)
            cardStackView.addArrangedSubview(newCardImageView)
            newCardImageView.widthAnchor.constraint(equalTo: cardStackView.heightAnchor, multiplier: 1/1.27).isActive = true
        }
    }
}

