//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameplay()
    }
    func initGameplay(){
        let pattern : UIImage = UIImage(named: "bg_pattern")!
        self.view.backgroundColor = UIColor(patternImage: pattern)
        var CardViewer : [UIImageView] = []
        let offset : CGFloat = CGFloat(self.view.frame.size.width/2) - CGFloat(self.view.frame.width/7 * 4) + CGFloat((self.view.frame.width/8)/2)
        for i in 0..<7{
            let j : CGFloat = CGFloat(i)
            CardViewer.append(UIImageView(image: UIImage(named: "card-back")))
            CardViewer[i].frame = CGRect(x: self.view.frame.size.width/7 * j - offset, y: 50, width: self.view.frame.size.width/8 , height: self.view.frame.size.width/8 * 1.27)
            self.view.addSubview(CardViewer[i])
        }
    }
}
