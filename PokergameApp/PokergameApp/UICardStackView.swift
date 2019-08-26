//
//  UICardStackView.swift
//  PokergameApp
//
//  Created by hw on 26/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class UICardStackView: UIStackView {
    private var stackViewSizeInfo: StackViewSizeInfo = StackViewSizeInfo()
    private var initialRectSize = CGRect.init(x: 1, y: 1, width: 100, height: 30)
    private var cardSize: Int = GameType.sevenCard.rawValue
    override init(frame: CGRect) {
        initialRectSize = frame
        super.init(frame: frame)
    }
    //constructor injection
    init(frame: CGRect, stackViewSizeInfo: StackViewSizeInfo, cardSize: Int){
        initialRectSize = frame
        self.stackViewSizeInfo = stackViewSizeInfo
        self.cardSize = cardSize
        super.init(frame: frame)
        addImageViewsInStackView()
    }
    //setter injection
    func configure(stackViewSizeInfo: StackViewSizeInfo, cardSize: Int){
        self.stackViewSizeInfo = stackViewSizeInfo
        self.cardSize = cardSize
        addImageViewsInStackView()
    }
    
    required init(coder: NSCoder) {
        cardSize = coder.decodeObject(forKey: "cardSize") as! Int
        stackViewSizeInfo = coder.decodeObject(forKey: "stackViewSizeInfo") as! StackViewSizeInfo
        initialRectSize = coder.decodeObject(forKey: "initialRectSize") as! CGRect
        super.init(coder: coder)
    }
    
    private func addImageViewsInStackView() {
        let imageWidth = (initialRectSize.width - stackViewSizeInfo.marginSpace
            * CGFloat(cardSize))/CGFloat(cardSize)
        for _ in 0..<cardSize {
            let currentCardRect = CGRect.init(x: 0, y: 0, width: imageWidth, height: frame.height)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: ImageInfo.cardBack)
            self.addArrangedSubview(uiImageView)
        }
        self.distribution = .fillEqually
        self.spacing = stackViewSizeInfo.marginSpace
    }
}
