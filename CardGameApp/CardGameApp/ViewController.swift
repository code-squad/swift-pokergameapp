//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let segmentedControlsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stutSegmentedControl : UISegmentedControl = {
        let items = PokerGame.GameStut.allCases.map { $0.description }
        let controls = UISegmentedControl(items: items)
        return controls
    }()
    
    private let playersSegmentedControl : UISegmentedControl = {
        let items = Players.PlayersNum.allCases.map { $0.description }
        let controls = UISegmentedControl(items: items)
        return controls
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupSegmentedControls()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupSegmentedControls() {
        self.view.addSubview(segmentedControlsStackView)
        setConstraintControlsStackView()
        addSegmentedControls()
    }
    
    private func addSegmentedControls() {
        segmentedControlsStackView.addArrangedSubview(stutSegmentedControl)
        segmentedControlsStackView.addArrangedSubview(playersSegmentedControl)
    }
    
    private func setConstraintControlsStackView() {
        let topConstant: CGFloat = 10
        let sideConstant: CGFloat = 100
        segmentedControlsStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: topConstant).isActive = true
        segmentedControlsStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: sideConstant).isActive = true
        segmentedControlsStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -sideConstant).isActive = true
    }
}
