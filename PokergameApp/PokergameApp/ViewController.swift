//
//  ViewController.swift
//  PokergameApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let customSpace: CGFloat = 10
    private var cardSize = 7
    private var width: CGFloat = 0
    private let ratio: CGFloat = 1.27
    private var margin = 10
    private var height: CGFloat {
        return CGFloat((width-customSpace * CGFloat(cardSize)) / CGFloat(cardSize)) * ratio
    }
    private var widthProportion: CGFloat = 0.9
    private var deckSizeRect: CGRect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
    private lazy var stackview: UIStackView = UIStackView.init(frame: deckSizeRect)
    private let verticalConstant: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        width = view.frame.width * widthProportion
        deckSizeRect = CGRect.init(x: 0, y: 0, width: width, height: height)
        ///stack view
        stackview = UIStackView.init(frame: deckSizeRect)
        addImageViewsInStackView()
        view.addSubview(stackview)
        setConstraints()
    }
    
    private func addImageViewsInStackView(){
        let imageWidth = (deckSizeRect.width - CGFloat(margin*cardSize))/CGFloat(cardSize)
        let imageHeight = height
        for _ in 0..<cardSize  {
            let currentCardRect = CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: "\(ImageInfo.cardBack)")!
            stackview.addArrangedSubview(uiImageView)
        }
        stackview.distribution = .fillEqually
        stackview.spacing = customSpace
    }
    
    private func setConstraints(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: verticalConstant)
        let widthConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: width)
        let heightConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute:  NSLayoutConstraint.Attribute.height, multiplier: 0, constant: height)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let backgroundPatternImage = UIImage.init(named: "\(ImageInfo.background)") else {
            return
        }
        view.backgroundColor = UIColor.init(patternImage: backgroundPatternImage)
    }

}

