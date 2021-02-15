//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setStackView()
    }
   
    func setBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
    }
    
    func setStackView() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        for _ in 0...6 {
            self.stackView.addArrangedSubview(generateImage())
        }
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    func generateImage() -> UIImageView {
        let imageView: UIImageView = {
            let width:CGFloat = self.view.bounds.width/8
            let height:CGFloat = width*1.27
            let imageView = UIImageView()
            
            imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
            
            let image = UIImage(named: "card-back")
            imageView.image = image
            return imageView
        }()
        return imageView
    }

}

