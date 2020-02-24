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
    
    weak var datasource: StackViewDataSource?
    private var gameStyle: Bool = false
    private var gameStyleSegementedTitle: [String] = ["5 cards", "7 cards"]
    private var numberOfPlayerSegementedTitle: [String] = ["2 peoples", "3 peoples", "4 peoples"]
    private let viewBackground: String = "bg_pattern"
    
    private var gameStyleSegementedControl: UISegmentedControl
    private var numberOfPlayerSegementedControl: UISegmentedControl
    private var stackView: StackView = StackView()
    
    override init(frame: CGRect) {
        gameStyleSegementedControl = UISegmentedControl(items: gameStyleSegementedTitle)
        numberOfPlayerSegementedControl = UISegmentedControl(items: numberOfPlayerSegementedTitle)
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        gameStyleSegementedControl = UISegmentedControl(items: gameStyleSegementedTitle)
        numberOfPlayerSegementedControl = UISegmentedControl(items: numberOfPlayerSegementedTitle)
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        apply(background: viewBackground)
        configureGameStyleSegementControl()
        configureNumberofPlayers()
        configureStackView()
    }
    
    private func apply(background: String) {
        backgroundColor = UIColor(patternImage: UIImage(named: background) ?? UIImage())
    }
    
    private func configureGameStyleSegementControl() {
        addSubview(gameStyleSegementedControl)
        gameStyleSegementedControl.selectedSegmentIndex = 0
        gameStyleSegementedControl.addTarget(self, action: #selector(translateGameStyle), for: .valueChanged)
        gameStyleSegementedControl.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.centerX.equalTo(self)
        }
    }
    
    private func configureNumberofPlayers() {
        addSubview(numberOfPlayerSegementedControl)
        numberOfPlayerSegementedControl.selectedSegmentIndex = 0
        numberOfPlayerSegementedControl.addTarget(self, action: #selector(translateNumberOfPlayers), for: .valueChanged)
        numberOfPlayerSegementedControl.snp.makeConstraints { (make) in
            make.top.equalTo(gameStyleSegementedControl.snp.bottom).offset(16)
            make.leading.equalTo(gameStyleSegementedControl.snp.leading)
            make.centerX.equalTo(self)
        }
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(numberOfPlayerSegementedControl.snp.leading)
            make.trailing.equalTo(numberOfPlayerSegementedControl.snp.trailing)
            make.top.equalTo(numberOfPlayerSegementedControl.snp.bottom).offset(16)
        }
    }
    
    @objc private func translateGameStyle() {
        datasource?.stackForAt(gameStyle)
        gameStyle.toggle()
    }
    
    @objc private func translateNumberOfPlayers() {
        datasource?.numberOfRow(selectedItem: numberOfPlayerSegementedControl.selectedSegmentIndex)
    }
}
