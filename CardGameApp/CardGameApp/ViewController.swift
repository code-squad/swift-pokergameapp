//
//  ViewController.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .darkGray
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

