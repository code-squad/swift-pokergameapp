//
//  ViewController.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private var gameView = GameTableView()
    private var manager = DataManager()
    
    override func loadView() {
        view = GameTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.datasource = manager
    }
}
