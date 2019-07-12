//
//  ViewController.swift
//  CardGameApp
//
//  Created by joon-ho kil on 7/12/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        
        drawCards()
    }
    
    private func drawCards () {
        for index in 0..<7 {
            let coordinateX = Double(10 + 57 * index)
            let image: UIImage = UIImage(named: "card-back")!
            let imageView = UIImageView(image: image)
        
            self.view.addSubview(imageView)
            imageView.frame = CGRect(x: Double(coordinateX), y: 30.0, width: 50.0, height: 63.5)
        }
    }
}

