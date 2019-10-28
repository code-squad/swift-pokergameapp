//
//  ViewController.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)

    }

}
