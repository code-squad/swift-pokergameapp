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
    private var height: CGFloat
    
    init(frame: CGRect, number: Int, stackViewSizeInfo: StackViewSizeInfo, height: CGFloat) {
        initialRectSize = frame
        self.stackViewSizeInfo = stackViewSizeInfo
        self.height = height
        
        super.init(frame: frame)
        addImageViewsInStackView(number)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addImageViewsInStackView(_ cardSize: Int) {
        let imageWidth = (initialRectSize.width - stackViewSizeInfo.marginSpace
            * CGFloat(cardSize))/CGFloat(cardSize)
        let imageHeight = height
        for _ in 0..<cardSize {
            let currentCardRect = CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: ImageInfo.cardBack)
            self.addArrangedSubview(uiImageView)
        }
        self.distribution = .fillEqually
        self.spacing = stackViewSizeInfo.marginSpace
    }
}
