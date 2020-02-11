//
//  FirstView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

final class GameTableView: UIView {
    
    private var stackView: UIStackView = UIStackView()
    private let viewBackground: String = "bg_pattern"
    private let cardBackground: String = "card-back"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        patternBackground()
        configuration(stackView)
        makeStackConstraint(stackView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func patternBackground() {
        backgroundColor = UIColor(patternImage: UIImage(named: viewBackground) ?? UIImage())
    }

    private func creatCards(_ stack: UIStackView, amount: Int) {
        (0...amount).forEach { _ in
            let card = UIImageView(image: UIImage(named: cardBackground) ?? UIImage())
            card.snp.makeConstraints { (make) in
                make.height.equalTo(card.snp.width).multipliedBy(1.27)
            }
            stack.addArrangedSubview(card)
        }
    }
    
    private func configuration(_ stack: UIStackView) {
        creatCards(stackView, amount: 6)
        stack.distribution = .equalSpacing
        stack.spacing = 4
        addSubview(stackView)
    }
    
    private func makeStackConstraint(_ stackView: UIStackView) {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(60)
        }
    }
}
