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
    
    private let pokerGame = PokerGame()
    
    private var stud : PokerGame.Stud = .sevenCardStud
    private var numOfPlayer : PokerGame.NumOfPlayer = .four
    
    @objc fileprivate func handleStudControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            stud = .sevenCardStud
            break
            
        case 1:
            stud = .fiveCardStud
            break
            
        default:
            stud = .sevenCardStud
            break
        }
        pokerGame.setGameStyle(stud: stud, numOfPlayer: numOfPlayer)
    }
    
    @objc fileprivate func handleNumOfPlayerControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            numOfPlayer = .one
            break
            
        case 1:
            numOfPlayer = .two
            break
            
        case 2:
            numOfPlayer = .three
            break
            
        case 3 :
            numOfPlayer = .four
            break
            
        default:
            numOfPlayer = .four
            break
        }
        pokerGame.setGameStyle(stud: stud, numOfPlayer: numOfPlayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        createViews()
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
        studSegmentedControl.setConstraint(topAnchor: view.topAnchor, top: 70, leadingAnchor: view.leadingAnchor, leading: 110, trailingAnchor: view.trailingAnchor, trailing: -110)
        numOfPlayerSegmentedControl.setConstraint(topAnchor: studSegmentedControl.bottomAnchor, top: 10, leadingAnchor: view.leadingAnchor, leading: 110, trailingAnchor: view.trailingAnchor, trailing: -110)
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
        studSegmentedControl = createSegmentedControl(items: ["7 Cards","5 Cards"], selectedSegmentIndex: 0, action: #selector(handleStudControl(_:)))
        numOfPlayerSegmentedControl = createSegmentedControl(items: ["1명","2명","3명","4명"], selectedSegmentIndex: 3, action : #selector(handleNumOfPlayerControl(_:)))
    }
    
    func createStackView(spacing : CGFloat, axis : NSLayoutConstraint.Axis) -> UIStackView{
        let stackView = UIStackView()
        
        stackView.spacing = spacing
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    func createSegmentedControl(items : [String], selectedSegmentIndex : Int, action : Selector) -> UISegmentedControl{
        let control = UISegmentedControl(items: items)
        
        control.selectedSegmentIndex = selectedSegmentIndex
        control.layer.borderWidth = 1
        control.layer.borderColor = UIColor.white.cgColor
        control.translatesAutoresizingMaskIntoConstraints = false
        
        control.addTarget(self, action: action, for: .valueChanged)
        
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
