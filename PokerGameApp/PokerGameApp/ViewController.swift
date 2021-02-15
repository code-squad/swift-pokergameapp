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

        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        self.view.addSubview(imageView5)
        self.view.addSubview(imageView6)
        self.view.addSubview(imageView7)
        
    }
    lazy var imageView1: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 0, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView2: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 1, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView3: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 2, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView4: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 3, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView5: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 4, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView6: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 5, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()
    lazy var imageView7: UIImageView = {
        let width:CGFloat = self.view.bounds.width/7
        let height:CGFloat = width*1.27
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/7) * 6, y: 80, width: width, height: height))
        let image = UIImage(named: "card-back")
        imageView.image = image
        return imageView
    }()

}

