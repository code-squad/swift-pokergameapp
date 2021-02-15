//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let filepath = Bundle.main.path(forResource: "bg_pattern", ofType: "png")!
        self.view.backgroundColor = UIColor(patternImage: UIImage(contentsOfFile: filepath)!)
        
        var imgView: [UIImageView] = []
        var width: CGFloat = 0
        let height: CGFloat = self.view.bounds.height / 10
        let imgWidth: CGFloat = 50
        let imgHeight: CGFloat = imgWidth * 1.27
        
        for i in 0..<7 {
            imgView.append(UIImageView(frame: CGRect(x: width, y: height, width: imgWidth, height: imgHeight)))
            imgView[i].image = UIImage(named: "card-back.png")
            self.view.addSubview(imgView[i])
            width += self.view.bounds.width / 7
        }
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}

