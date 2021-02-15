//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!
    let image = UIImage(named: "card-back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setStackView()
    }
   
    func setBackground() {
        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    func setStackView() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = generateImage()
        for _ in 0...6 {
            self.stackView.addArrangedSubview(imageView)
        }
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    func generateImage() -> UIImageView {
        let width = self.view.bounds.width/8
        let height = width*1.27
        let imageView = UIImageView()
        
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        imageView.image = image
        return imageView
    }

}

