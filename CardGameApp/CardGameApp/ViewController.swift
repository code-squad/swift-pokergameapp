//
//  ViewController.swift
//  CardGameApp
//
//  Created by 한천희 on 2020/02/11.
//  Copyright © 2020 한천희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "bg_pattern")!))

    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }

}
