//
//  ViewController.swift
//  PokergameApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var dataController: DataController!
    private struct CardSizeInfo {
        var cardSize = 7
        let ratio: CGFloat = 1.27
    }
    private struct StackViewSizeInfo {
        let widthProportion: CGFloat = 0.9
        let marginSpace: CGFloat = 10
        var width: CGFloat = 0
    }
    
    private struct InitialRectSize {
        var basicCGRect: CGRect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
    }
    
    var height: CGFloat {
        return CGFloat((stackViewSizeInfo.width-stackViewSizeInfo.marginSpace * CGFloat(cardSizeInfo.cardSize))
            / CGFloat(cardSizeInfo.cardSize)) * cardSizeInfo.ratio
    }
    
    private func configureData(_ dataController: DataController){
        self.dataController = dataController
    }
    
    private var cardSizeInfo = CardSizeInfo()
    private var initialRectSize = InitialRectSize()
    private var stackViewSizeInfo = StackViewSizeInfo()
    private var segmentControlsSizeInfo = SegmentControlsSizeInfo()
    private let verticalConstant: CGFloat = 200
    private lazy var stackview = UIStackView.init(frame: initialRectSize.basicCGRect)
    private lazy var gameTypeSegmentedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
    private lazy var playerTypeSementedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundPatternImage()
        
        stackViewSizeInfo.width = view.frame.width * stackViewSizeInfo.widthProportion
        initialRectSize.basicCGRect = CGRect.init(x: 0, y: 0, width: stackViewSizeInfo.width, height: height)
        stackview = UIStackView.init(frame: initialRectSize.basicCGRect)
        
        gameTypeSegmentedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
        playerTypeSementedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
        setSegmentedControls()

        addImageViewsInStackView()
        view.addSubview(stackview)
        setConstraints()
    }
    
    struct SegmentControlsSizeInfo {
        let xCoordinate: CGFloat = 126
        let yCoordinateFirst: CGFloat = 100
        let yCoordinateSecond: CGFloat = 150
        let width: CGFloat = 160
        let height: CGFloat = 30
    }
    
    private func setSegmentedControls(){
        setGameTypeSegmentedControl()
        setPlayerTypeSegmentedControlRectSize()
        view.addSubview(gameTypeSegmentedControl)
        view.addSubview(playerTypeSementedControl)
    }
    
    private func setGameTypeSegmentedControl() {
        let gameTypeSegmentedControlRectSize = createGameTypeSegmentedControlRectSize()
        gameTypeSegmentedControl = UISegmentedControl.init(frame: gameTypeSegmentedControlRectSize)
        gameTypeSegmentedControl.tintColor = .white
        gameTypeSegmentedControl.backgroundColor = .black
        gameTypeSegmentedControl.insertSegment(withTitle: GameType.fiveCard.description, at: 0, animated: true)
        gameTypeSegmentedControl.insertSegment(withTitle: GameType.sevenCard.description, at: 0, animated: true)
    }
    
    private func setPlayerTypeSegmentedControlRectSize(){
        let playerTypeSegmentedControlRectSize = createPlayerTypeSegmentedControlRectSize()
        playerTypeSementedControl = UISegmentedControl.init(frame: playerTypeSegmentedControlRectSize)
        playerTypeSementedControl.tintColor = .white
        playerTypeSementedControl.backgroundColor = .black
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.four.description, at: 0, animated: true)
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.three.description, at: 0, animated: true)
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.two.description, at: 0, animated: true)
    }
    
    private func createGameTypeSegmentedControlRectSize() -> CGRect {
        return  CGRect.init(x: segmentControlsSizeInfo.xCoordinate,
                            y: segmentControlsSizeInfo.yCoordinateFirst,
                            width: segmentControlsSizeInfo.width,
                            height: segmentControlsSizeInfo.height)
    }
    
    private func createPlayerTypeSegmentedControlRectSize() -> CGRect {
        return CGRect.init(x: segmentControlsSizeInfo.xCoordinate,
                           y: segmentControlsSizeInfo.yCoordinateSecond,
                           width: segmentControlsSizeInfo.width,
                           height: segmentControlsSizeInfo.height)
    }
    
    
    private func setBackgroundPatternImage(){
        guard let backgroundPatternImage = UIImage.init(named: "\(ImageInfo.background)") else {
            return
        }
        view.backgroundColor = UIColor.init(patternImage: backgroundPatternImage)
    }
    
    private func addImageViewsInStackView(){
        let imageWidth = (initialRectSize.basicCGRect.width - stackViewSizeInfo.marginSpace
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
    
    private func setSegmentedControlConstraints(){
        
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

