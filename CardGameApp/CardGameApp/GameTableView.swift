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
        apply(background: viewBackground)
        configurate()
        makeStackConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        apply(background: viewBackground)
        configurate()
        makeStackConstraint()
    }
    
    private func apply(background: String) {
        backgroundColor = UIColor(patternImage: UIImage(named: background) ?? UIImage())
    }

    private func creatCards(amount: Int) {
        (0...amount).forEach { _ in
            let card = UIImageView(image: UIImage(named: cardBackground) ?? UIImage())
            card.snp.makeConstraints { (make) in
                make.height.equalTo(card.snp.width).multipliedBy(1.27)
            }
            stackView.addArrangedSubview(card)
        }
    }
    
    private func configurate() {
        creatCards(amount: 6)
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        addSubview(stackView)
    }
    
    private func makeStackConstraint() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(60)
        }
    }
}
