//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground(imageName : Constant.BACKGROUND_IMAGE_NAME)
    }
    
    private func assignBackground(imageName name : String) {
        if let image = UIImage(named: name) {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
}

