//
//  ViewController.swift
//  PokergameApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var width: CGFloat = 0
    private var height: CGFloat = 0
    private var deckSizeRect: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = view.frame.width*0.9
        height = CGFloat((width-70) / 7) * 1.27
        deckSizeRect = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        ///stack view
        let stackview: UIStackView = UIStackView.init(frame: deckSizeRect)
        stackview.backgroundColor = .blue
        
        let imageWidth = (deckSizeRect.width-70)/7
        let imageHeight = height
        var imageX = view.frame.minX
        let imageY = view.frame.minY //+ 20
        /// add imageView
        for _ in 0..<7  {
            let currentCardRect = CGRect.init(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: "card-back.png")!
            stackview.addArrangedSubview(uiImageView)
        }
        stackview.distribution = .fillEqually
        stackview.spacing = 10
        view.addSubview(stackview)
        
        ///view hierarchy는 뷰 계층구조 완성되고 나서 나타나야 한다.
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 20)
        let widthConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: width)
        let heightConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute:  NSLayoutConstraint.Attribute.height, multiplier: 0, constant: height)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let backgroundPatternImage = UIImage.init(named: "bg_pattern.png") else {
            return
        }
        view.backgroundColor = UIColor.init(patternImage: backgroundPatternImage)
    }

}

