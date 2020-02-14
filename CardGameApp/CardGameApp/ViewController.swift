//
//  ViewController.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/06.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var pokerStackView : UIStackView!
    private var segmentStackView : UIStackView!
    private var cardStackView : UIStackView!
    
    private var studSegmentedControl: UISegmentedControl!
    private var numOfPlayerSegmentedControl: UISegmentedControl!
    
    @objc fileprivate func handleStudControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break
            
        case 1:
            break
            
        default:
            break
        }
    }
    
    @objc fileprivate func handleNumOfPlayerControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break
            
        case 1:
            break
            
        case 2:
            break
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        setUpBackground()
        view.addSubview(pokerStackView)
        pokerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        pokerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        pokerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        pokerStackView.addArrangedSubview(segmentStackView)
        segmentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        segmentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        segmentStackView.addArrangedSubview(studSegmentedControl)
        segmentStackView.addArrangedSubview(numOfPlayerSegmentedControl)
        //        setupCardStackViewContraint()
        //        setupViews()
        //        addCardIntoStackView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setUpBackground(){
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        //        self.view.addSubview(cardStackView)
    }
    
    private func setupCardStackViewContraint() {
        self.cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.cardStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        self.cardStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    func addCardIntoStackView(){
    }
    
    private func createCard(cardName: String) -> UIImageView{
        let imageView = UIImageView(image: UIImage(named: cardName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
    
    private func setupViews() {        
        view.addSubview(studSegmentedControl)
        studSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive=true
        studSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive=true
        studSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive=true
    }
    
    func createViews(){
        pokerStackView = createStackView(spacing: 4, axis: .vertical)
        segmentStackView = createStackView(spacing: 10, axis: .vertical)
        cardStackView = createStackView(spacing: 4, axis: .horizontal)
        studSegmentedControl = createSegmentedControl(items: ["7 Cards","5 Cards"])
        numOfPlayerSegmentedControl = createSegmentedControl(items: ["2명","3명","4명"])
    }
    
    func createStackView(spacing : CGFloat, axis : NSLayoutConstraint.Axis) -> UIStackView{
        let stackView = UIStackView()
        
        stackView.spacing = spacing
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    func createSegmentedControl(items : [String]) -> UISegmentedControl{
        let control = UISegmentedControl(items: items)
        
        control.selectedSegmentIndex = 0
        control.layer.borderWidth = 1
        control.layer.borderColor = UIColor.white.cgColor
        control.translatesAutoresizingMaskIntoConstraints = false
        
        control.addTarget(self, action: #selector(handleStudControl(_:)), for: .valueChanged)
        
        return control
    }
}
