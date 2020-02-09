//
//  FirstView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

class FirstView: UIView {
    
    lazy var stackView: UIStackView! = {
        let stackView: UIStackView = UIStackView()
        creatCards(stackView, amount: 6)
        configuration(stackView)
        addSubview(stackView)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        patternBackground()
        makeStackConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstView {
    private func checkImage(name: String) -> UIImage {
        guard let image = UIImage(named: name) else { return UIImage() }
        return image
    }
    
    private func patternBackground() {
        backgroundColor = UIColor(patternImage: checkImage(name: "bg_pattern"))
    }
    
    private func creatCards(_ stack: UIStackView, amount: Int) {
        (0...amount).forEach { _ in
            let card = UIImageView(image: checkImage(name: "card-back"))
            card.snp.makeConstraints { (make) in
                make.height.equalTo(card.snp.width).multipliedBy(1.27)
            }
            stack.addArrangedSubview(card)
        }
    }
    
    private func configuration(_ stack: UIStackView) {
        stack.distribution = .equalSpacing
        stack.spacing = 4
    }
    
    private func makeStackConstraint() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(60)
        }
    }
}
