//
//  ViewController.swift
//  PokergameApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private struct CardSizeInfo {
        var cardSize = 7
        let ratio: CGFloat = 1.27
    }
    private struct StackViewSizeInfo {
        let widthProportion: CGFloat = 0.9
        let marginSpace: CGFloat = 10
        var width: CGFloat = 0
        var deckSizeRect: CGRect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
    }
    var height: CGFloat {
        return CGFloat((stackViewSizeInfo.width-stackViewSizeInfo.marginSpace * CGFloat(cardSizeInfo.cardSize))
            / CGFloat(cardSizeInfo.cardSize)) * cardSizeInfo.ratio
    }
    private var cardSizeInfo = CardSizeInfo()
    private var stackViewSizeInfo = StackViewSizeInfo()
    private lazy var stackview: UIStackView = UIStackView.init(frame: stackViewSizeInfo.deckSizeRect)
    private let verticalConstant: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundPatternImage()
        
        stackViewSizeInfo.width = view.frame.width * stackViewSizeInfo.widthProportion
        stackViewSizeInfo.deckSizeRect = CGRect.init(x: 0, y: 0, width: stackViewSizeInfo.width, height: height)
        stackview = UIStackView.init(frame: stackViewSizeInfo.deckSizeRect)
        addImageViewsInStackView()
        view.addSubview(stackview)
        
        setConstraints()
    }
    
    private func setBackgroundPatternImage(){
        guard let backgroundPatternImage = UIImage.init(named: "\(ImageInfo.background)") else {
            return
        }
        view.backgroundColor = UIColor.init(patternImage: backgroundPatternImage)
    }
    
    private func addImageViewsInStackView(){
        let imageWidth = (stackViewSizeInfo.deckSizeRect.width - stackViewSizeInfo.marginSpace
            * CGFloat(cardSizeInfo.cardSize))/CGFloat(cardSizeInfo.cardSize)
        let imageHeight = height
        for _ in 0..<cardSizeInfo.cardSize  {
            let currentCardRect = CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: ImageInfo.cardBack)
            stackview.addArrangedSubview(uiImageView)
        }
        stackview.distribution = .fillEqually
        stackview.spacing = stackViewSizeInfo.marginSpace
    }
    
    private func setConstraints(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: verticalConstant)
        let widthConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: stackViewSizeInfo.width)
        let heightConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute:  NSLayoutConstraint.Attribute.height, multiplier: 0, constant: height)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

