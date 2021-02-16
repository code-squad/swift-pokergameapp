//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: optionalBindingBGImage())
    }
    
    func optionalBindingBGImage() -> UIImage {
        guard let image = UIImage(named: "bg_pattern") else {
            return UIImage()
        }
        return image
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

