//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 한천희 on 2021/02/16.
//

import UIKit

class PokerViewController: UIViewController {
    
    let cardBackName = "card-back.png"

    
    let cardBackView: UIImageView = {
//        let theImageView = UIImageView()
//        theImageView.image =
//        let image = UIImage(named: "card-back.png")
        let cardBackView = UIImageView(image: UIImage(named: "card-back.png"))
//        cardBackView.translatesAutoresizingMaskIntoConstraints = false
        return cardBackView
    }()
    
    
    
    func createCardView(fileName: String) -> UIImageView {
        
        // UIImage
        let image = UIImage(named: fileName)
        let imageView = UIImageView(image: image)
        
        //
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
//        view.addSubview(imageView)
        
        return imageView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
        
//        let imageView = createCardView(fileName: cardBackName)
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
//        view.addSubview(imageView)
        
        view.addSubview(cardBackView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

