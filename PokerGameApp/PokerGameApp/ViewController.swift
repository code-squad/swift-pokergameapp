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
    
    let segmentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let playersStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 30
        return stackView
    }()

    let playerInfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    let gameStyleSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: GameStyle.gameTypes)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gameStyleChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    let gamePlayerSegmentControl  : UISegmentedControl = {
        let segment = UISegmentedControl(items: PlayerCount.availablePlayerCount)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gamePlayerChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func gameStyleChanged (_ sender : UISegmentedControl) {
        pokerGame.reset(with: GameStyle(rawValue: sender.selectedSegmentIndex) ?? .fiveCardStud)
    }
    
    @objc func gamePlayerChanged (_ sender : UISegmentedControl) {
        pokerGame.reset(howMany: PlayerCount(rawValue: sender.selectedSegmentIndex) ?? .one)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        if self.view.subviews.count == 0 {
            do {
                self.view.backgroundColor = UIColor(patternImage: try optionalBindingImage(calledCard: "bg_pattern"))
                self.cardBacksideImage = try optionalBindingImage(calledCard: "card-back")
            }
            catch {
                print(error)
                present(trouble.personalError(), animated: true, completion: nil)
            }
            setSegmentStackViewConstraints()
            setSegmentControllerConstraints()
            setPlayersStackViewConstraints()
            setPlayerInfoStackView(with: "test1")
            createCardStackView()
            setPlayerInfoStackView(with: "test2")
            createCardStackView()
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
    
    private func setSegmentStackViewConstraints() {
        self.view.addSubview(segmentStackView)
        segmentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        segmentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setSegmentControllerConstraints() {
        gamePlayerSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        gamePlayerSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        gameStyleSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        gameStyleSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        self.segmentStackView.addArrangedSubview(gamePlayerSegmentControl)
        self.segmentStackView.addArrangedSubview(gameStyleSegmentControl)
    }
    
    private func setPlayersStackViewConstraints() {
        self.view.addSubview(playersStackView)
        playersStackView.topAnchor.constraint(equalTo: segmentStackView.bottomAnchor, constant: 30).isActive = true
        playersStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        playersStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setPlayerInfoStackView(with playerName : String) {
        playersStackView.addArrangedSubview(playerInfoStackView)
        let nameLabel : UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            label.font = UIFont.systemFont(ofSize: 30)
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.left
            label.text = playerName
            return label
        }()
        playerInfoStackView.addArrangedSubview(nameLabel)
    }
    
    private func createCardStackView() {
        let cardStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = -10
            stackView.distribution = .fillEqually
            return stackView
        }()
        addCard2CardView(cardCount: 7, stackView: cardStackView)
        playerInfoStackView.addArrangedSubview(cardStackView)
    }
    
    private func addCard2CardView( cardCount : Int ,stackView : UIStackView) {
        for _ in 0..<cardCount {
            stackView.addArrangedSubview(generatingBacksideOfCard())
        }
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

