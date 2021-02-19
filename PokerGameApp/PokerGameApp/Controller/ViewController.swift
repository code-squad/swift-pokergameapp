//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    var cardDeck = CardDeck()
    var game = PokerGame(withPlayersOf: .four, stud: .sevenCardStud)
    
    lazy var cardSelectSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["7 cards", "5 cards"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .none
        control.layer.cornerRadius = 5.0
        control.layer.masksToBounds = true
        control.layer.borderWidth = 1
        control.layer.borderColor = .init(gray:1, alpha: 1)
        let font = UIFont.systemFont(ofSize: 20)
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font
        ]
        control.setTitleTextAttributes(normalTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
     }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") ?? UIImage()
        let cardBacksideImage: UIImage = UIImage(named: "card-back") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        
        self.view.addSubview(cardSelectSegmentedControl)
        configureCardNumberSelectSegmentedControl()
        self.view.addSubview(verticalStackView)
        configureDashboardStackView()
        guard let gameResult = game.play() else { return }
        addSubviewToDashboardStackView(with: gameResult, to: verticalStackView)
    }
    
    func configureCardNumberSelectSegmentedControl() {
        cardSelectSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardSelectSegmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        cardSelectSegmentedControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        cardSelectSegmentedControl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func configureDashboardStackView() {
        verticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        verticalStackView.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func addSubviewToDashboardStackView(with gameResult: Array<Array<Card>>, to verticalStackView: UIStackView) {
        verticalStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15 * CGFloat(gameResult.count)).isActive = true
        let individualStacks = makeIndividualStackView(with: gameResult)
        for stack in individualStacks {
            verticalStackView.addArrangedSubview(stack)
        }
    }
  
    func makeIndividualStackView(with gameResult: Array<Array<Card>>) -> Array<UIStackView> {
        var individualStacks: Array<UIStackView> = []
        gameResult.forEach { (cardArray) in
            let stackViewWithNameLabel: UIStackView = {
               let stackView = UIStackView()
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.axis = .vertical
                stackView.distribution = .fillProportionally
                stackView.spacing = 0
                return stackView
            }()
            let nameLabel: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.textColor = UIColor.red
                label.text = "이보게"
                return label
            }()
            
            stackViewWithNameLabel.addArrangedSubview(nameLabel)
            stackViewWithNameLabel.addArrangedSubview(addCardsToHorizontalCardStack(with: cardArray))
            individualStacks.append(stackViewWithNameLabel)
        }
        return individualStacks
    }
    
    func addCardsToHorizontalCardStack(with cards: Array<Card>) -> UIStackView {
        let stackView = makeHorizontalCardStack()
        for card in cards {
            let newCardImageView = card.makeCardImageView()
            stackView.addArrangedSubview(newCardImageView)
        }
        let prizeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        stackView.addArrangedSubview(prizeImageView)
        return stackView
    }
    
    func makeHorizontalCardStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }
}
