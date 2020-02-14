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
        setupBackground()
        addViewsIntoSuperView()
        setupViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupBackground(){
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupCardStackViewContraint() {
        self.cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.cardStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        self.cardStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    func addViewsIntoSuperView(){
        view.addSubview(studSegmentedControl)
        view.addSubview(numOfPlayerSegmentedControl)
    }
    
    func setupViews(){
        studSegmentedControl.setConstraint(topAnchor: view.topAnchor, top: 70, leadingAnchor: view.leadingAnchor, leading: 120, trailingAnchor: view.trailingAnchor, trailing: -120)
        numOfPlayerSegmentedControl.setConstraint(topAnchor: studSegmentedControl.bottomAnchor, top: 10, leadingAnchor: view.leadingAnchor, leading: 120, trailingAnchor: view.trailingAnchor, trailing: -120)
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
    
    func createViews(){
        pokerStackView = createStackView(spacing: 4, axis: .vertical)
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

extension UIView{
    func setConstraint(topAnchor : NSLayoutYAxisAnchor, top : CGFloat, leadingAnchor : NSLayoutXAxisAnchor, leading : CGFloat, trailingAnchor : NSLayoutXAxisAnchor, trailing : CGFloat){
        self.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing).isActive = true
    }
}
