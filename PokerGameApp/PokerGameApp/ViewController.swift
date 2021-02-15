//
//  ViewController.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        makeStackView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func makeCardImageView() -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: "card-back")
        imageView.image = image
        let cardWidth = view.frame.size.width/7
        let cardHeight = cardWidth * 1.27
        imageView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        return imageView
    }

    func makeStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        for _ in 0..<7 {
            stackView.addArrangedSubview(makeCardImageView())
        }
    }

}


