//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)

        setStackView()
        
    }
    var stackView: UIStackView!
    
    func setStackView() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        self.stackView.addArrangedSubview(imageView1)
        self.stackView.addArrangedSubview(imageView2)
        self.stackView.addArrangedSubview(imageView3)
        self.stackView.addArrangedSubview(imageView4)
        self.stackView.addArrangedSubview(imageView5)
        self.stackView.addArrangedSubview(imageView6)
        self.stackView.addArrangedSubview(imageView7)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
    }
    func generateImage() {
        
    }
    lazy var imageView1: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView2: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView3: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView4: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView5: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView6: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView7: UIImageView = {
        let width:CGFloat = self.view.bounds.width/8
        let height:CGFloat = width*1.27

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()

}

