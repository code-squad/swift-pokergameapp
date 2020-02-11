//
//  ViewController.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
    }

}
