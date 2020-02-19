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
    
    private let cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardViews()
        setupSegmentedControls()
    }

    private func setupBackground() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupSegmentedControls() {
        self.view.addSubview(segmentedControlsStackView)
        setConstraintControlsStackView()
    }
    private func setConstraintControlsStackView() {
        let boundaryConstant: CGFloat = 8
        segmentedControlsStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: boundaryConstant).isActive = true
        segmentedControlsStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: boundaryConstant).isActive = true
        segmentedControlsStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -boundaryConstant).isActive = true
    }

     private func setupCardViews(){
         self.view.addSubview(cardStackView)
         setConstraintCardStackView()
     }

     private func setConstraintCardStackView() {
         let boundaryConstant: CGFloat = 8
         cardStackView.topAnchor.constraint(
             equalTo: view.safeAreaLayoutGuide.topAnchor,
             constant: boundaryConstant).isActive = true
         cardStackView.leadingAnchor.constraint(
             equalTo: view.leadingAnchor,
             constant: boundaryConstant).isActive = true
         cardStackView.trailingAnchor.constraint(
             equalTo: view.trailingAnchor,
             constant: -boundaryConstant).isActive = true
     }
}
