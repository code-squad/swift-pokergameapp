//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    var cardBacksideImage = UIImage()
    let trouble = TroubleShooter()
    let pokerGame = PokerGame()
    let cardStackView = UIStackView()
    let topStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let gameStyleSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: GameStyle.allCases)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gameStyleChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    let gamePlayerSegmentControl  : UISegmentedControl = {
        let segment = UISegmentedControl(items: GameStyle.allCases)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gamePlayerChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func gameStyleChanged (_ sender : UISegmentedControl) {
        pokerGame.reset(with: GameStyle(rawValue: sender.selectedSegmentIndex) ?? .fiveCardStud)
    }
    
    @objc func gamePlayerChanged (_ sender : UISegmentedControl) {
        pokerGame.reset(howMany: PlayerCount(rawValue: sender.selectedSegmentIndex + 1) ?? .one)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        if cardStackView.subviews.count == 0 {
            do {
                self.view.backgroundColor = UIColor(patternImage: try optionalBindingImage(calledCard: "bg_pattern"))
                self.cardBacksideImage = try optionalBindingImage(calledCard: "card-back")
            }
            catch {
                print(error)
                present(trouble.personalError(), animated: true, completion: nil)
            }
            setStackView(cardStackView)
            addCard2StackView(cardCount: 7, stackView: cardStackView)
            setStackViewConstraints(stackView: cardStackView)
        }
        
//        let printClosure = { player in
//            print(player)
//        }
//        let newGame = PokerGame.init(howManyHands: .fiveCardStud, howManyPlayer: .three)
//
//        if false == newGame.test(with: printClosure) {
//            print("deck is empty, gameover")
//        }
//        newGame.reset(with: .sevenCardStud, howMany: .three)
//        if false == newGame.test(with: printClosure) {
//            print("deck is empty, gameover")
//        }
    }
    
    private func addCard2StackView( cardCount : Int ,stackView : UIStackView) {
        for _ in 0..<cardCount {
            stackView.addArrangedSubview(generatingBacksideOfCard())
        }
    }
    
    private func setStackViewConstraints(stackView : UIStackView) {
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setStackView(_ stackView : UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
    }
    
    private func optionalBindingImage(calledCard : String) throws -> UIImage {
        guard let image = UIImage(named: calledCard) else {
            throw TroubleShooter.errors.imageOptionalBindingError
        }
        return image
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    private func generatingBacksideOfCard() -> UIImageView {
        let imageView = UIImageView(image: self.cardBacksideImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
}

