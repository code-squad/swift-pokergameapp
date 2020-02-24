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
    var observer: NSKeyValueObservation?
    
    override func loadView() {
        view = gameView
        gameView.datasource = manager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observer = manager.observe(\.game, changeHandler: { (datamanager, value) in
            self.gameView.fetchGame(game: value.newValue)
        })
    }
}
