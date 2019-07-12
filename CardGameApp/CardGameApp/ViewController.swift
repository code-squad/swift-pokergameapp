//
//  ViewController.swift
//  CardGameApp
//
//  Created by joon-ho kil on 7/12/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cardGame = CardGame()
    @IBOutlet weak var menuSegemnt: UISegmentedControl!
    @IBOutlet weak var playerCountSegent: UISegmentedControl!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
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
    
    @IBAction func startCardGame(_ sender: Any) {
        let menuIndex = menuSegemnt.selectedSegmentIndex+1
        let menu = Menu.init(rawValue: menuIndex)!
        let userCountIndex = playerCountSegent.selectedSegmentIndex+2
        let userCount = UserCount.init(rawValue: userCountIndex)!
        
        do {
            let participant = try cardGame.executeMenu(menu, userCount)
        }
        catch let error as InputError
        {
            let alert = UIAlertController(title: "오류", message: error.localizedDescription, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "닫기", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        catch {
            
        }
        
        
    }
}

